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
t1 = zeros(1, numel(M));
for k = 1:numel(M)
    f = @() sinfun1(M(k)); % anonymous function handle
    t1(k) = timeit(f);
end

t2 = zeros(1, numel(M));
for k = 1:numel(M)
    f = @() sinfun2(M(k));
    t2(k) = timeit(f);
end

t3 = zeros(1, numel(M));
for k = 1:numel(M)
    f = @() sinfun3(M);
    t3(k) = timeit(f);
end

figure(1);
subplot(1, 3, 1);
plot(t1);
title('C-like');

subplot(1, 3, 2);
plot(t2);
title('preallocation');

subplot(1, 3, 3);
plot(t3);
title('vectorization');
