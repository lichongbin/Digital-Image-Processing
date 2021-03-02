close all;

% Fig(a)
img = imread('Fig0338(a)(blurry_moon).tif');
figure('Name', 'Fig0338(a)'), imshow(img);

h = [0, 1, 0; 1, -4, 1; 0, 1, 0];
li = filter2(h, img);
h2 = [1, 1, 1; 1, -8, 1; 1, 1, 1];
li2 = filter2(h2, img);

% Fig(b)
mask = li > 0;
limg = mask .* li;
max_value = max(limg(:));
min_value = min(limg(:));

lb = uint8(255 * limg / (max_value - min_value));
figure('Name', 'Fig0338(b)'), imshow(lb);
imwrite(lb, 'Fig0338(b).tif');

% Fig(c)
max_value = max(li(:));
min_value = min(li(:));
if min_value < 0
    limg = li - min_value;
else
    limg = li;
end

lc = uint8(255 * limg / (max_value - min_value));
figure('Name', 'Fig0338(c)'), imshow(lc);
imwrite(lc, 'Fig0338(c).tif');

% Fig(d)
limg = double(img) - li;
max_value = max(limg(:));
min_value = min(limg(:));

ld = uint8(255 * (limg - min_value) / (max_value - min_value));
figure('Name', 'Fig0338(d)'), imshow(ld);
imwrite(ld, 'Fig0338(d).tif');

% Fig(e)
limg = double(img) - li2;
max_value = max(limg(:));
min_value = min(limg(:));

le = uint8(255 * (limg - min_value) / (max_value - min_value));
figure('Name', 'Fig0338(e)'), imshow(le);
imwrite(le, 'Fig0338(e).tif');