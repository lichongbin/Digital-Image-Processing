% vector
v = [1 3 5 7 9]
v(2)
w = v.'
v(1:3)
v(3:end)
v([1 4 5])
v(1:2:end)

% matrix
A = [1 2 3; 4 5 6; 7 8 9]
A(2,:)
sum(A(:))

% logical indexing
D = logical([1 0 0; 0 0 1; 0 0 0])
A(D)

% function handle
f = @sin
f(pi/4)
sin(pi/4)

% anonymous function handle
g = @(x) x.^2
g(2)

r = @(x, y) sqrt(x.^2 + y.^2);
r(3, 4)

% cell array
char_array = {'area', 'centroid'}
C = {f, v, char_array}

% see a description of the variable
C(3)

% see the content of the variable
C{3}

% structure
f = imread('Fig0101.tif');
s.dm = size(f);
s.AI = mean2(f);
s.AIrows = mean(f, 2);
s.AIcols = mean(f, 1);


