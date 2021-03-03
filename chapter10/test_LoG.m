close all;

% Fig(a)
img = imread('Fig1022(a)(building_original).tif');
figure('Name', 'Fig1022(a)'), imshow(img);

% Fig(b)
hg = fspecial('gaussian', 25, 4);
hl = fspecial('laplacian', 0.2);
it = filter2(hg, img);
it = filter2(hl, it);

min_value = min(it(:));
max_value = max(it(:));
ib = uint8(255 * (it - min_value) / (max_value - min_value));
figure('Name', 'Fig1022(b)'), imshow(ib);
imwrite(ib, 'Fig1022(b).tif');

% Fig(c)
ic = zeros(size(img), 'uint8');
for r = 2:size(img, 1)-1
    for c = 2:size(img, 2)-1
        x = 0;
        pairs = [it(r-1, c), it(r+1, c); ...
                 it(r, c-1), it(r, c+1); ...
                 it(r-1, c-1), it(r+1, c+1); ...
                 it(r-1, c+1), it(r+1, c-1)];
        for i = 1:4
            if pairs(i, 1) * pairs(i, 2) <= 0
                x = x + 1;
            end
        end
        if x >= 2
            ic(r, c) = 255;
        end
    end
end

figure('Name', 'Fig1022(c)'), imshow(ic);
imwrite(ic, 'Fig1022(c).tif');


% Fig(d)
thresh = 0.04 * max(it(:));

id = zeros(size(img), 'uint8');
for r = 2:size(img, 1)-1
    for c = 2:size(img, 2)-1
        x = 0;       
        pairs = [it(r-1, c), it(r+1, c); ...
            it(r, c-1), it(r, c+1); ...
            it(r-1, c-1), it(r+1, c+1); ...
            it(r-1, c+1), it(r+1, c-1)];
        for i = 1:4
            if pairs(i, 1) * pairs(i, 2) <= 0 ...
                    && abs(pairs(i, 1) - pairs(i, 2)) > thresh
                x = x + 1;
            end
        end
        if x >= 2
            id(r, c) = 255;
        end
    end
end

figure('Name', 'Fig1022(d)'), imshow(id);
imwrite(id, 'Fig1022(d).tif');
