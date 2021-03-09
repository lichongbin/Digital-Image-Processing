hsize = 5;
sigma = 1;

h1 = gaussiankernel(sigma, hsize);
h2 = h1;
h1 = h1';
h = h1 * h2;

hs = fspecial('gaussian', hsize, sigma);

% create a sample matrix
x = 0:63;
mx = reshape(x, [8, 8]);
mx = mx';

k = floor(hsize / 2);
% u = mx(1, :);
% 
% l = length(u);
% 
% u2 = [u(2+k-1:-1:2), u, u(l-1:-1:l-k)];
% u3 = conv(u2, h2, 'valid');

u4 = separablefilter2(mx, h2, h1, false);
u5 = separablefilter2(mx, h2, h1, true);

u6 = filter2(hs, mx);

m1 = mx(1:hsize, 1:hsize);
m2 = m1 .* hs;
s = sum(m2(:));


