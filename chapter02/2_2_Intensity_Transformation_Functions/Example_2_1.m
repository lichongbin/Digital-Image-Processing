f = imread('Fig0203(a).tif');

% show the source image
figure(1);
subplot(2, 3, 1);
imshow(f);
title('a');

% the negative image can be obtained in the following two methods:
% b = imadjust(f, [0 1], [1 0]);
b = imcomplement(f);
subplot(2, 3, 2);
imshow(b);
title('b');

% expands the gray scale interval between 0.5 and 0.75 to 
% the full [0, 1] range.
c = imadjust(f, [0.5 0.75], [0 1]);
subplot(2, 3, 3);
imshow(c);
title('c');

% compress the low end and expand the high end.
d = imadjust(f, [], [], 2);
subplot(2, 3, 4);
imshow(d);
title('d');

e = imadjust(f, stretchlim(f), []);
subplot(2, 3, 5);
imshow(e);
title('e');

f = imadjust(f, stretchlim(f), [1 0]);
subplot(2, 3, 6);
imshow(f);
title('f');

