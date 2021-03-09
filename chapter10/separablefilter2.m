function [y] = separablefilter2(x, hx, hy, optimize)
% SEPARABLEFILTER2 do the same thing as filter2,
%       but in two steps. This will improve
%       the speed performance of filter2.
%
%       hx --- horizontal vector
%       hy --- vertical vector
%              the length of both hx and hy 
%              should be odd.
%       optimize --- true or false 
%                    there is optimized implementaion
%                    which can speedup the algorithm
%

if optimize

    [rows, cols] = size(x);
    z = zeros(rows, 1, class(x));
    y = zeros(size(x), class(x));
    
    lx = length(hx);
    ly = length(hy);
    kx = floor(lx / 2);
    ky = floor(ly / 2);
     
    col_index = [kx+1:-1:2, 1:cols, cols-1:-1:cols-kx];
    row_index = [ky+1:-1:2, 1:rows, rows-1:-1:rows-ky];
    
    for c = 1:cols
        
        for r = 1:rows
            z(r) = sum(hy .* x(row_index(r:r+ly-1), c));
        end
        clear r;
                
        for i = -kx:kx
            ci = c + i;
            if ci < 1 || ci > cols
                continue;
            end
            y(:, ci) = y(:, ci) + hx(kx-i+1) * z;
            if ci == cols
                ds = sprintf('k%d x c%d -> c%d', kx-i+1, c, ci);
                disp(ds);
            end
        end
        
        if (c > 1 && c <= kx+1) || (c >= (cols - kx) && c < cols)
            [rci, rki, count] = findrelatedcolumns(c, kx, lx, cols);
            for i = 1:count
                y(:, rci(i)) = y(:, rci(i)) + hx(rki(i)) * z;
                if rci(i) == cols
                    ds = sprintf('k%d x c%d -> c%d', rki(i), c, rci(i));
                    disp(ds);
                end
            end
        end
        
    end

else

    t1 = sfilter(x, hx);
    t2 = sfilter(t1', hy');
    y = t2';

end

end

function [y] = sfilter(x, h)
% SFILTER convolve along the rows of x by h
%
y = zeros(size(x), class(x));
len = size(x, 2);
k = floor(length(h) / 2);

for r = 1:size(x, 1)
    d = x(r, :);
    t = [d(2+k-1:-1:2), d, d(len-1:-1:len-k)];
    y(r, :) = conv(t, h, 'valid');
end

end


function [ci, ki, count] = findrelatedcolumns(c, kx, lx, cols)
% FINDRELEATEDCOLUMNS find columns to which c contributes
%

count = 0;
ci = zeros(1, kx, 'uint32');
ki = zeros(1, kx, 'uint32');

if c > 1 && c <= kx+1
    base = kx + 1 - (c - 1);
    for i = 1:base
        count = count + 1;
        ci(count) = i;
        ki(count) = base + 1 - i;
    end
else
    base = kx + 1 - (cols - c);
    for i = 1:base
        count = count + 1;
        ci(count) = cols + 1 - i;
        ki(count) = lx - base + i;
    end
end

end