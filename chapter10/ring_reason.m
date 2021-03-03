close all;

img = imread('Fig1022(a)(building_original).tif');
figure('Name', 'Fig1022(a)'), imshow(img);

hg = fspecial('gaussian', 25, 4);
hl = fspecial('laplacian', 0.2);
it = filter2(hg, img);
it = filter2(hl, it);

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
        elseif it(r, c) > 0
            ic(r, c) = 128;
        end
    end
end

figure('Name', 'Fig1022(c)'), imshow(ic);
imwrite(ic, 'ring_reason.tif');