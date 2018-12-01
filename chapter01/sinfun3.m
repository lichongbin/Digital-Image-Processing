function y = sinfun3(M)
% vectorization
x = 0:M-1;
y = sin(x ./ (100 * pi));