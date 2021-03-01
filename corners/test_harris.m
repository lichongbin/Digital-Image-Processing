% I = checkerboard;
I = imread('scene.jpg');

corners = harris(I, 5, 1000);

figure('Name', 'harris corner'),
imshow(I), hold on;
plot(corners(:, 2), corners(:, 1), 'gx');

img = drawcorners(I, corners, 5);
imwrite(img, 'test_harris.jpg');
% figure, imshow(img);



