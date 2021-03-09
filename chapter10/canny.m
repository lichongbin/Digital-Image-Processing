function [bin] = canny(src, sigma, th, tl)
% CANNY implements canny edge detection algorithm
%   src --- source image
%   th  --- high threshold
%   tl  --- low threshold
%
gray = im2single(src);

k = ceil(6 * sigma);
if rem(k, 2) == 0
    k = k + 1;
end

h = fspecial('gaussian', k, sigma);
is = filter2(h, gray, 'same');

hx = -fspecial('sobel');
hy = hx.';

gx = filter2(hx, is);
gy = filter2(hy, is);

fm = sqrt(gx.^2 + gy.^2);
fa = atan2(gx, gy);

gn = zeros(size(gray), 'single');

% horizontal 
% 3*pi/8 < a < 5*pi/8
% -5*pi/8 < a < -3*pi/8
dh1 = fa >= 3*pi/8 & (fa < 5*pi/8);
dh2 = fa >= -5*pi/8 & fa < -3*pi/8;
dh = dh1 | dh2;
for r = 2:size(gray, 1)-1
    for c = 2:size(gray, 2)-1
        if dh(r, c) && fm(r-1, c) < fm(r, c) && fm(r+1, c) < fm(r, c)
            gn(r, c) = fm(r, c);
        end
    end
end

% vertical
% -pi/8 < a < pi/8
% -pi < a < -7*pi/8
% 7*pi/8 < a < pi
dv1 = fa >= -pi/8 & fa < pi/8;
dv2 = fa >= -pi & fa < -7*pi/8;
dv3 = fa >= 7*pi/8 & fa < pi;
dv = dv1 | dv2 | dv3;
for r = 2:size(gray, 1)-1
    for c = 2:size(gray, 2)-1
        if dv(r, c) && fm(r, c-1) < fm(r, c) && fm(r, c+1) < fm(r, c)
            gn(r, c) = fm(r, c);
        end
    end
end

% 45
% pi/8 < a < 3*pi/8
% -7*pi/8 < a < -5*pi/8
d45 = (fa >= pi/8 & fa < 3*pi/8) ...
    | (fa >= -7*pi/8 & fa < -5*pi/8);
for r = 2:size(gray, 1)-1
    for c = 2:size(gray, 2)-1
        if d45(r, c) && fm(r-1, c-1) < fm(r, c) ...
                && fm(r+1, c+1) < fm(r, c)
            gn(r, c) = fm(r, c);
        end
    end
end

% -45
% 5*pi/8 < a < 7*pi/8
% -3*pi/8 < a < -pi/8
dm45 = (fa >= 5*pi/8 & fa < 7*pi/8) ...
    | (fa >= -3*pi/8 & fa < -pi/8);
for r = 2:size(gray, 1)-1
    for c = 2:size(gray, 2)-1
        if dm45(r, c) && fm(r-1, c+1) < fm(r, c) ...
                && fm(r+1, c-1) < fm(r, c)
            gn(r, c) = fm(r, c);
        end
    end
end

gnh = gn > th;
gnl = gn > tl;
gnl = gnl - gnh;

for r = 2:size(gray, 1)-1
    for c = 2:size(gray, 2)-1
        if gnh(r, c) > 0
            nb = [r-1, c-1; r-1, c; r-1, c+1; ...
                r, c-1; r, c+1; ...
                r+1, c-1; r+1, c; r+1, c+1];
            for i = 1:4
                if gnl(nb(i, 1), nb(i, 2)) > 0
                    gnh(nb(i, 1), nb(i, 2)) = 1;
                end
            end
        end
    end
end

bin = uint8(gnh > 0) * 255;
end


