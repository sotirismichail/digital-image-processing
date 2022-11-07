function img = compute_max(im, k)

% im = rgb2gray(i);
% im_pad = padarray(im, [floor(k/2) floor(k/2)], 'symmetric');
% x = [1:3]';
% y = [1:3]';
% 
% for k = 1:size(im_pad, 1) - 2
%     for j = 1: size(im_pad, 2) - 2
%         max_i = reshape(im_pad(k + x - 1, j + y -1), [], 1);
%         im_max(k, j) = max(max_i);
%     end
% end
% 
% img = uint8(im_max);

im_gray = im2gray(im);
[m, n] = size(im_gray);
im_pad = padarray(im_gray, [m + 2*floor(k/2) m+2*floor(k/2)]);

kernel = ones(k) / k ^ 2;

for col = floor(k/2) + 1 : n - floor(k/2)
    for row = floor(k/2) + 1 : m - floor(k/2)
        local_max = 0;
        for col_index = 1 : k
            ic = col + col_index - floor(k/2) - 1;
            for row_index = 1 : k
                ir = row + row_index - floor(k/2) - 1;
                if im_gray(ir, ic) > local_max
                    local_max = im_gray(ir, ic);
                end
            end
        end
        img_max(row, col) = local_max * kernel(row_index, col_index);
    end
end

img = uint8(img_max);

end