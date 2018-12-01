function y = sinfun2(M)
% an improved implementation by preallocation
x = 0:M-1;
y = zeros(1, numel(x)); % preallocation
for k = 1:numel(x)
    y(k) = sin(x(k) / (100 * pi));
end