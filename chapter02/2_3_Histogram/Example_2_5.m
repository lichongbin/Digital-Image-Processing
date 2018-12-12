f = imread('Fig0208(a).tif');
figure(1);
subplot(2, 2, 1);
imshow(f);

subplot(2, 2, 2);
imhist(f);
ylim('auto');

g = histeq(f, 256);
subplot(2, 2, 3);
imshow(g);

subplot(2, 2, 4);
imhist(g);
ylim('auto');