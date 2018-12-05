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

x = (0:N-1) - floor(N/2);
y = (0:M-1) - floor(M/2);
[X, Y] = meshgrid(x, y);
M = sqrt(X.^2 + Y.^2);
H = (M >= (R - sqrt(2)/2)) & (M <= (R + sqrt(2)/2));

% X0 = floor(M/2);
% Y0 = floor(N/2);
% if R > M - X0 - 1 || R > N - Y0 - 1
% error('Circle does not fit in rectangle.')
% end
% if (floor(R) ~= R) || (R < 1)
% error('The radius R must be an integer >= 1.')
% end
% % Compute a matrix, A, of distances from any point in the rectangle to its
% % center.
% x = 0:M - 1;
% y = 0:N - 1;
% [Y, X] = meshgrid(y, x);
% A = sqrt((X - X0).^2 + (Y - Y0).^2);
% % Find all the distances in the range (R - L/2) >= A(I,J) <= (R + L/2), with
% % L = sqrt(2). These are the points comprising the circumference of the
% % circle within a tolerance of sqrt(2). This tolerance is chosen based on
% % the fact that the coordinates are separated by 1 in the horizontal
% % and vertical directions and by sqrt(2) in the diagonal direction.
% H = ((R - sqrt(2)/2) <= A) & (A <= (R + sqrt(2)/2));