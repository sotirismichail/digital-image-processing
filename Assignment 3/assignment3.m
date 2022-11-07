close all
clear all
clc

img = imread('lena_gray_512.tif');
[rows, columns] = size(img);
gaussian_filter = fspecial('gaussian', [15 15], 20);

%% DIY convolution
img_conv_diy = convolution(img, gaussian_filter);
err_diy = immse(img, uint8(img_conv_diy))
snr_diy = psnr(img, uint8(img_conv_diy))

imwrite(uint8(img_conv_diy), 'lena_diy.png');
%% Using conv2
img_conv2 = conv2(img, gaussian_filter, 'same');
err_conv2 = immse(img, uint8(img_conv2))
snr_conv2 = psnr(img, uint8(img_conv2))

imwrite(uint8(img_conv2), 'lena_conv2.png');
%% Using imfilter
img_imfilter = imfilter(img, gaussian_filter, 'conv');
err_imfilter = immse(img, uint8(img_imfilter))
snr_imfilter = psnr(img, uint8(img_imfilter))

imwrite(uint8(img_imfilter), 'lena_imfilter.png');
%% Proving the convolution theorem
img_fourier = fft2(img);
gaussian_filter_pad = padarray(gaussian_filter, [floor((rows - 15)/2) floor((columns - 15)/2)], 'replicate', 'both');
filter_fourier = fft2(padarray(gaussian_filter_pad, [1 1], 'pre'));
conv_f = bsxfun(@times, img_fourier, filter_fourier);
conv_if = ifft2(conv_f);
err_fourier = immse(img, uint8(conv_if))
snr_fourier = psnr(img, uint8(conv_if))

imwrite(uint8(conv_if), 'lena_convif.png');
