sinfun1(5)

% example of tic and toc
% these two commands measure how long a code block to execute
tic; sinfun1(10000); toc;
f = @() sinfun1(10000);
s1 = timeit(f);

% this measurement will not be accurate 
% beacause it can be disturbed by the enviroment

% timeit can be used to obtain reliable, repeatable time measurements
M = 500 : 500 : 20000;
for k = 1:numel(M)
    f = @() sinfun1(M(k));
    t(k) = timeit(f);
end


for k = 1:numel(M)
    f = @() sinfun2(M(k));
    t(k) = timeit(f);
end
