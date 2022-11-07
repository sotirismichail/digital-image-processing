function img = compute_median(im, k)

[m, ~, ~] = size(im);
im_pad = padarray(im, [floor(k(1)/2) floor(k(2)/2)], 'replicate');
im_col = im2col(im_pad, [k(1) k(2)], 'sliding');
sorted_cols = sort(im_col, 1, 'ascend');
med_vector = sorted_cols(floor(k(1)*k(2)/2) + 1, :);
img = col2im(med_vector, [k(1) k(2)], size(im_pad), 'sliding');

end