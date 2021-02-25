function [corners] = moravec(varargin)
% MORAVEC implements moravec corner detection algorithm
%
% corners = moravec(img, w) detects corners within the 
%    window size of w
%
% corners = moravec(img, w, count) detects corners within
%    the window size of w, 
%    count limits the number of corners
%
[img, w, count] = ParseInputs(varargin{:});

[ih, iw] = size(img);

k = floor(w/2);

% row, column, CRF
corners = zeros(iw * ih, 3, 'uint32');
corner_count = 0;

CRF = zeros(ih, iw, 'double');

% calculate CRF(Corner Response Function)
% Vh, Vv, Vd, Va
v = zeros(1, 4, 'double');
for r = k+1:ih-k
    for c = k+1:iw-k
        v(:) = 0;
        for i = -k:k-1
            d = img(r, c+i) - img(r, c+i+1);
            v(1) = v(1) + d * d;
            d = img(r+i, c) - img(r+i+1, c);
            v(2) = v(2) + d * d;
            d = img(r+i, c+i) - img(r+i+1, c+i+1);
            v(3) = v(3) + d * d;
            d = img(r+i, c-i) - img(r+i+1, c-i-1);
            v(4) = v(4) + d * d;
        end
        CRF(r, c) = min(v);
    end
end

% find threshhold
oi = sort(CRF(:), 'descend');
thresh = oi(count);

% Non-maximum suppression
nmw = floor(1.5 * w);
hnmw = floor(nmw / 2);
for r = hnmw+1:ih-hnmw
    for c = hnmw+1:iw-hnmw
        v = CRF(r, c);
        if v >= thresh
            corner_count = corner_count + 1;
            for r2 = r-hnmw:r-hnmw+nmw-1
                for c2 = c-hnmw:c-hnmw+nmw-1
                    if (CRF(r2, c2) >= v)
                        corners(corner_count, :) = [r2, c2, v];
                        v = CRF(r2, c2);
                    end
                end
            end
            r2 = corners(corner_count, 1);
            c2 = corners(corner_count, 2);
            CRF(r2-hnmw:r2+hnmw-1, c2-hnmw:c2+hnmw-1) = 0;
        end
    end
end

corners = corners(1:corner_count, :);

%-------------------------------
% Function  ParseInputs
%
function [img, w, count] = ParseInputs(varargin)

img = varargin{1};
w = 4;

if ~isa(img, 'double')
    img = double(img);
end

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


