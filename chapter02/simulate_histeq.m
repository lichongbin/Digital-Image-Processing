function g = simulate_histeq(f)
% SIMULATE_HISTEQ implements the function as histeq.
%
%

hist = simulate_imhist(f) ./ numel(f);
s = cumsum(hist) * 255;
g = zeros(size(f), class(f));
for i=1:255
    g = g + uint8((f == i) * s(i));
end