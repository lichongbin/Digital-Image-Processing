function H = imcircle(R, M, N)
%IMCIRCLE Generates a circle inside a rectangle.
% H = IMCIRCLE(R, M, N) generates a circle of radius R centered
% on a rectangle of height M and width N. H is a binary image with
% 1s on the circle and 0s elsewhere. R must be an integer >= 1.
% if (rem(M, 2) == 0)
%     hx = M/2;
% else
%     hx = (M-1)/2;
% end
% 
% if ()

[x, y] = meshgrid(-N/2:N/2, -M/2:M/2);
H = (abs(x.^2 + y.^2) - R.^2) < 1;