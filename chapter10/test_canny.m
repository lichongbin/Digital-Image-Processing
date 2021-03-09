close all;

% Fig(a)
img = imread('Fig1022(a)(building_original).tif');
figure('Name', 'Fig1022(a)'), imshow(img);

bin = edge(img, 'canny');
figure('Name', 'Fig1025(d) using DIP toolbox'), imshow(bin);

bin2 = canny(img, 2, 0.1, 0.04);
figure('Name', 'Fig1025(d) using canny implementation of myself'),
imshow(bin2);
imwrite(bin2, 'Fig1025(d).tif');
