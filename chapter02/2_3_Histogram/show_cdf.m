f = imread('Fig0208(a).tif');
hnorm = imhist(f) ./ numel(f);
cdf = cumsum(hnorm);

x = linspace(0, 1, 256);
plot(x, cdf);
axis([0 1 01]);
set(gca, 'xtick', 0:.2:1);
set(gca, 'ytick', 0:.2:1);
xlabel('Input intensity values', 'fontsize', 9);
ylabel('Output intensity values', 'fontsize', 9);