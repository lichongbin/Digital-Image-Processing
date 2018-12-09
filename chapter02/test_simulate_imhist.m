f = imread('Fig0208(a).tif');
figure(1);
subplot(2, 3, 1);
imshow(f);
title('Source Image');

subplot(2, 3, 2);
h = imhist(f);
horz = 0:255;
bar(horz, h);
title('Histogram from imhist');

subplot(2, 3, 3);
sh = simulate_imhist(f);
horz = 0:255;
bar(horz, sh);
title('Histogram from simulate\_imhist');

subplot(2, 3, 4);
g = histeq(f);
imshow(g);
title('Image from histeq');

subplot(2, 3, 5);
g2 = simulate_histeq(f);
imshow(g2);
title('Image from simulate\_histeq');