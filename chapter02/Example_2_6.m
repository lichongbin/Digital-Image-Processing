f = imread('Fig0206(a).tif');
g = intrans(f, 'stretch', mean2(f), 0.9);
figure(1);
subplot(1, 2, 1);
imshow(f);
title('Bone scan image');

subplot(1, 2, 2);
imshow(g);
title('Contrast-stretching');