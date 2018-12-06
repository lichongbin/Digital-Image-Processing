f = imread('Fig0203(a).tif');
figure(1), 
subplot(2, 2, 1), imhist(f), title('imhist');

h = imhist(f, 25);
horz = linspace(0, 255, 25);
subplot(2, 2, 2);
bar(horz, h);
axis([0 255 0 60000]);
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:20000:60000);
title('bar');

subplot(2, 2, 3);
stem(horz, h, 'fill');
axis([0 255 0 60000]);
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:20000:60000);
title('stem');

hc = imhist(f);
subplot(2, 2, 4);
plot(hc); % Use the default values.
axis([0 255 0 25000]);
set(gca, 'xtick', [0:50:255]);
set(gca, 'ytick', [0:2000:15000]);
title('plot');
