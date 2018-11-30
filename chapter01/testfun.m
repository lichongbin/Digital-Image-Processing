sinfun1(5)
tic; sinfun1(10000); toc;
f = @() sinfun1(10000);
s = timeit(f);

M = 500 : 500 : 20000;
for k = 1:numel(M)
    f = @() sinfun1(M(k));
    t(k) = timeit(f);
end