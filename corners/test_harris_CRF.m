f = @(x, y) x *y - 0.04 *((x +y).^2);
fc = fcontour(f, [0 50 0 50]);
fc.LevelList =[4 3 2 1 0 -1 -2 -3];
colorbar