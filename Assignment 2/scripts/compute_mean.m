function img = compute_mean(im, k)

im_gray = im2gray(im);
[m, n] = size(im_gray);
im_pad = padarray(im_gray, [m + 2*floor(k/2) m+2*floor(k/2)]);

kernel = ones(k) / k ^ 2;

for col = floor(k/2) + 1 : n - floor(k/2)
    for row = floor(k/2) + 1 : m - floor(k/2)
        local_sum = 0;
        for col_index = 1 : k
            ic = col + col_index - floor(k/2) - 1;
            for row_index = 1 : k
                ir = row + row_index - floor(k/2) - 1;
                local_sum = local_sum + double(im_gray(ir, ic)) * kernel(row_index, col_index);
            end
        end
        img_mean(row, col) = local_sum;
    end
end
img = uint8(img_mean);
end