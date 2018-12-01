function y = sinfun1(M)
% an implementation which is very C-like
% there is not any optimization
x = 0:M-1;
for k = 1:numel(x)
    y(k) = sin( x(k) / (100 * pi));
end