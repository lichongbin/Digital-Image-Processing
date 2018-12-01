f1 = twodsin1(1, 1 / (4 * pi), 1 / (4 * pi), 512, 512);
figure(1), imshow(f1, []);

f2 = twodsin2(1, 1 / (4 * pi), 1 / (4 * pi), 512, 512);
figure(2), imshow(f2, []);

t1 = timeit(@() twodsin1(1, 1 / (4 * pi), 1 / (4 * pi), 512, 512));
t2 = timeit(@() twodsin2(1, 1 / (4 * pi), 1 / (4 * pi), 512, 512));
