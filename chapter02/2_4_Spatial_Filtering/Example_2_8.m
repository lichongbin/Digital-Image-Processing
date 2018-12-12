addpath('..\Project');

s = imread('Fig0216(a).tif');
[f revert] = tofloat(s);
figure(1);
subplot(2, 3, 1);
imshow(f);
title('Source');

w = ones(31);
gd = imfilter(f, w);
subplot(2, 3, 2);
imshow(gd, []);
title('Pad with zeros');

gr = imfilter(f, w, 'replicate');
subplot(2, 3, 3);
imshow(gr, []);
title('replicate');

gs = imfilter(f, w, 'symmetric');
subplot(2, 3, 4);
imshow(gs, []);
title('symmetric');

gc = imfilter(f, w, 'circular');
subplot(2, 3, 5);
imshow(gc, []);
title('circular');

g8r = imfilter(s, w, 'replicate');
subplot(2, 3, 6);
imshow(g8r, []);
title('resoult of clipping');

