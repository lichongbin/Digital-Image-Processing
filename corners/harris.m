function [corners] = harris(varargin)
% HARRIS implements harris corner detection algorithm
% 
% corners = harris(img, w) detects corners within the 
%    window size of w
%
% corners = harris(img, w, count) detects corners within
%    the window size of w, 
%    count limits the number of corners
%
[img, w, count] = ParseInputs(varargin{:});

if(size(img, 3) == 3)
    gray = rgb2gray(img);
else
    gray = img;
end

fx = [-1, 0, 1];
Ix = filter2(fx, gray);     % x-derivatives
fy = [-1; 0; 1];
Iy = filter2(fy, gray);     % y-derivatives

Ix2 = Ix .^ 2;
Iy2 = Iy .^ 2;
Ixy = Ix .* Iy;
clear Ix Iy;

h = fspecial('gaussian', w, 0.5);

Ix2 = filter2(h, Ix2, 'same');
Iy2 = filter2(h, Iy2, 'same');
Ixy = filter2(h, Ixy, 'same');

clear h;

[ih, iw] = size(gray);

R = zeros(ih, iw);
for i = 1:ih
    for j = 1:iw
        M = [Ix2(i,j) Ixy(i,j); ...
             Ixy(i,j) Iy2(i,j)];
        R(i,j) = det(M)-0.06*(trace(M))^2;   
    end
end

% non-maximum suppression
k = floor(w / 2);
result = zeros(ih, iw);
cnt = 0;
for i = k+1:ih-k
    for j = k+1:iw-k
        if  R(i,j) > R(i-1,j-1) && ...
                R(i,j) > R(i-1,j) && ...
                R(i,j) > R(i-1,j+1) && ...
                R(i,j) > R(i,j-1) && ...
                R(i,j) > R(i,j+1) && ...
                R(i,j) > R(i+1,j-1) && ... 
                R(i,j) > R(i+1,j) && ...
                R(i,j) > R(i+1,j+1)
            result(i,j) = 1;
            cnt = cnt + 1;
        end
    end
end

Rs = zeros(cnt, 1);
[posr, posc] = find(result == 1);
for i = 1:cnt
    Rs(i) = R(posr(i), posc(i));
end

[~, ix] = sort(Rs, 'descend');
ps = count;
if cnt < 100
    ps = cnt;
end

corners = zeros(ps, 2, 'uint32');
for i = 1:ps
    corners(i, :) = [posr(ix(i)), posc(ix(i))];
end


%-------------------------------
% Function  ParseInputs
%
function [img, w, count] = ParseInputs(varargin)

img = varargin{1};
w = 3;

narginchk(1, 3);

varNames={'img', 'w', 'count'};
for x = 2:1:length(varargin)
    validateattributes(varargin{x}, {'numeric'},...
                  {'integer' 'real' 'positive' 'scalar'}, ...
                  mfilename, varNames{x}, x);
end

switch nargin    
  case 2
    w = varargin{2};
    count = floor(0.05 * size(img, 1) * size(img, 2));

  case 3
    w = varargin{2};
    count = varargin{3}; 
end

if rem(w, 2) == 0
    w = w + 1;
end
