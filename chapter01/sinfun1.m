% an implementation which is very like C
% there is not any optimization
function y = sinfun1(M)
x = 0 : M-1;
for k = 1 : numel(x)
    y(k) = sin(x(k) / (100 * pi));
end