I = checkerboard(10, 5, 6);
I = I > 0.5;

corners = moravec(I, 4);

figure('Name', 'Checkerboard'),
imshow(I), hold on;
for i = 1:size(corners, 1)
    x = corners(i, 2);
    y = corners(i, 1);    
    plot(x, y, 'Marker', 'x', 'Color', 'blue'), hold on;
end







