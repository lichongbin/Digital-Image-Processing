function [h] = gaussiankernel(sigma, ksize)
% GAUSSIANKERNEL create 1-D gaussian kernel
% 
if rem(ksize, 2) == 0
    ksize = ksize + 1;
end

k = floor(ksize / 2);
x = -k:k;

h = exp(-x.^2 / (2 * sigma^2));
h = h / sum(h(:));

end