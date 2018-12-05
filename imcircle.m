function H = imcircle(R, M, N)
%IMCIRCLE Generates a circle inside a rectangle.
% H = IMCIRCLE(R, M, N) generates a circle of radius R centered
% on a rectangle of height M and width N. H is a binary image with
% 1s on the circle and 0s elsewhere. R must be an integer >= 1.

if (2 * R > M || 2 * R > N)
    error('The radius R is too big.');
end

if (R < 1)
    error('The radius R is too small.');
end

x = (0:N-1) - floor(N/2);
y = (0:M-1) - floor(M/2);
[X, Y] = meshgrid(x, y);
M = sqrt(X.^2 + Y.^2);
H = (M >= (R - sqrt(2)/2)) & (M <= (R + sqrt(2)/2));