% 找出计算指定列需要的列
lx = 5;
kx = floor(lx / 2);

cols = 8;

head_map = zeros(kx+1, 1 + lx, 'uint32');
tail_map = zeros(kx+1, 1 + lx, 'uint32');

hi = [kx+1:-1:2, 1:lx];
for i = 1:kx+1
    head_map(i, :) = [i, hi(i:i+lx-1)];
end

ti = [cols-lx+1:cols, cols-1:-1:cols-kx];
for i = cols-kx:cols
    d =  i - (cols - kx);
    tail_map(d+1, :) = [i, ti(d+1:d+lx)];
end

