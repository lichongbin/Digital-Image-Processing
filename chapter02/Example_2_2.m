f = imread('Fig0205(a).tif');
g = im2uint8(mat2gray(log(1 + double(f))));
figure(1);
subplot(1, 2, 1);
imshow(f);
title('Fourier spectrum');

subplot(1, 2, 2);
imshow(g);
title('Log of Fourier spectrum');