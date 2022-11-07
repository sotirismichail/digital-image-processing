%Script for Assignment 1
%
%For the course Digital Image Processing
%at Technical University of Crete, 2021
%
%Author: Sotirios Michail
%AM: 2015030140
%
%Using MATLAB R2020b, with the Image Processing Library installed

clear all

%Image load
in_m = imread('retriever.tiff');
[nrows, ncols, ~] = size(in_m);
imshow(in_m);

%Downsampling, AA on 
Ds1 = imresize(in_m, 'Scale', [1/2 1/4], 'Antialiasing', true);
imwrite(Ds1, 'downsample_1_aa.png');
Ds2 = imresize(in_m, 'Scale', [1/4 1/2], 'Antialiasing', true);
imwrite(Ds2, 'downsample_2_aa.png');
Ds3 = imresize(in_m, 1/8, 'Antialiasing', true);
imwrite(Ds3, 'downsample_3_aa.png');

%Downsampling, AA off
Ds4 = imresize(in_m, 'Scale', [1/2 1/4], 'Antialiasing', false);
imwrite(Ds4, 'downsample_1_noaa.png');
Ds5 = imresize(in_m, 'Scale', [1/4 1/2], 'Antialiasing', false);
imwrite(Ds5, 'downsample_2_noaa.png');
Ds6 = imresize(in_m, 1/8, 'Antialiasing', false);
imwrite(Ds6, 'downsample_3_noaa.png');

%Upsampling
Us1n = imresize(Ds1, [nrows ncols], "nearest");
imwrite(Us1n, 'upsample_1_aa_nearest.png');
Us1b = imresize(Ds1, [nrows ncols], 'bilinear');
imwrite(Us1b, 'upsample_1_aa_bilinear.png');
Us1c = imresize(Ds1, [nrows ncols], 'bicubic');
imwrite(Us1c, 'upsample_1_aa_bicubic.png');

Us2n = imresize(Ds2, [nrows ncols], 'nearest');
imwrite(Us2n, 'upsample_2_aa_nearest.png');
Us2b = imresize(Ds2, [nrows ncols], 'bilinear');
imwrite(Us2b, 'upsample_2_aa_bilinear.png');
Us2c = imresize(Ds2, [nrows ncols], 'bicubic');
imwrite(Us2c, 'upsample_2_aa_bicubic.png');

Us3n = imresize(Ds3, [nrows ncols], 'nearest');
imwrite(Us3n, 'upsample_3_aa_nearest.png');
Us3b = imresize(Ds3, [nrows ncols], 'bilinear');
imwrite(Us3b, 'upsample_3_aa_bilinear.png');
Us3c = imresize(Ds3, [nrows ncols], 'bicubic');
imwrite(Us3c, 'upsample_3_aa_bicubic.png');

Us4n = imresize(Ds4, [nrows ncols], 'nearest');
imwrite(Us4n, 'upsample_1_noaa_nearest.png');
Us4b = imresize(Ds4, [nrows ncols], 'bilinear');
imwrite(Us4b, 'upsample_1_noaa_bilinear.png');
Us4c = imresize(Ds4, [nrows ncols], 'bicubic');
imwrite(Us4c, 'upsample_1_noaa_bicubic.png');

Us5n = imresize(Ds5, [nrows ncols], 'nearest');
imwrite(Us5n, 'upsample_2_noaa_nearest.png');
Us5b = imresize(Ds5, [nrows ncols], 'bilinear');
imwrite(Us5b, 'upsample_2_noaa_bilinear.png');
Us5c = imresize(Ds5, [nrows ncols], 'bicubic');
imwrite(Us5c, 'upsample_2_noaa_bicubic.png');

Us6n = imresize(Ds6, [nrows ncols], 'nearest');
imwrite(Us6n, 'upsample_3_noaa_nearest.png');
Us6b = imresize(Ds6, [nrows ncols], 'bilinear');
imwrite(Us6b, 'upsample_3_noaa_bilinear.png');
Us6c = imresize(Ds6, [nrows ncols], 'bicubic');
imwrite(Us6c, 'upsample_3_noaa_bicubic.png');

fileid = fopen('data.txt','w');

%MSR
mserr_1n = immse(Us1n, in_m);
mserr_1b = immse(Us1b, in_m);
mserr_1c = immse(Us1c, in_m);
mserr_2n = immse(Us2n, in_m);
mserr_2b = immse(Us2b, in_m);
mserr_2c = immse(Us2c, in_m);
mserr_3n = immse(Us3n, in_m);
mserr_3b = immse(Us3b, in_m);
mserr_3c = immse(Us3c, in_m);
mserr_4n = immse(Us4n, in_m);
mserr_4b = immse(Us4b, in_m);
mserr_4c = immse(Us4c, in_m);
mserr_5n = immse(Us5n, in_m);
mserr_5b = immse(Us5b, in_m);
mserr_5c = immse(Us5c, in_m);
mserr_6n = immse(Us6n, in_m);
mserr_6b = immse(Us6b, in_m);
mserr_6c = immse(Us6c, in_m);

%PSNR
peaksnr_1n = psnr(Us1n, in_m);
peaksnr_1b = psnr(Us1b, in_m);
peaksnr_1c = psnr(Us1c, in_m);
peaksnr_2n = psnr(Us2n, in_m);
peaksnr_2b = psnr(Us2b, in_m);
peaksnr_2c = psnr(Us2c, in_m);
peaksnr_3n = psnr(Us3n, in_m);
peaksnr_3b = psnr(Us3b, in_m);
peaksnr_3c = psnr(Us3c, in_m);
peaksnr_4n = psnr(Us4n, in_m);
peaksnr_4b = psnr(Us4b, in_m);
peaksnr_4c = psnr(Us4c, in_m);
peaksnr_5n = psnr(Us5n, in_m);
peaksnr_5b = psnr(Us5b, in_m);
peaksnr_5c = psnr(Us5c, in_m);
peaksnr_6n = psnr(Us6n, in_m);
peaksnr_6b = psnr(Us6b, in_m);
peaksnr_6c = psnr(Us6c, in_m);

fprintf(fileid, 'MSE_1n: %0.4f\tPSNR_1n: %0.4f\n', mserr_1n, peaksnr_1n);
fprintf(fileid, 'MSE_1b: %0.4f\tPSNR_1b: %0.4f\n', mserr_1b, peaksnr_1b);
fprintf(fileid, 'MSE_1c: %0.4f\tPSNR_1c: %0.4f\n', mserr_1c, peaksnr_1c);
fprintf(fileid, 'MSE_2n: %0.4f\tPSNR_2n: %0.4f\n', mserr_2n, peaksnr_2n);
fprintf(fileid, 'MSE_2b: %0.4f\tPSNR_2b: %0.4f\n', mserr_2b, peaksnr_2b);
fprintf(fileid, 'MSE_2c: %0.4f\tPSNR_2c: %0.4f\n', mserr_2c, peaksnr_2c);
fprintf(fileid, 'MSE_3n: %0.4f\tPSNR_3n: %0.4f\n', mserr_3n, peaksnr_3n);
fprintf(fileid, 'MSE_3b: %0.4f\tPSNR_3b: %0.4f\n', mserr_3b, peaksnr_3b);
fprintf(fileid, 'MSE_3c: %0.4f\tPSNR_3c: %0.4f\n', mserr_3c, peaksnr_3c);
fprintf(fileid, 'MSE_4n: %0.4f\tPSNR_4n: %0.4f\n', mserr_4n, peaksnr_4n);
fprintf(fileid, 'MSE_4b: %0.4f\tPSNR_4b: %0.4f\n', mserr_4b, peaksnr_4b);
fprintf(fileid, 'MSE_4c: %0.4f\tPSNR_4c: %0.4f\n', mserr_4c, peaksnr_4c);
fprintf(fileid, 'MSE_5n: %0.4f\tPSNR_5n: %0.4f\n', mserr_5n, peaksnr_5n);
fprintf(fileid, 'MSE_5b: %0.4f\tPSNR_5b: %0.4f\n', mserr_5b, peaksnr_5b);
fprintf(fileid, 'MSE_5c: %0.4f\tPSNR_5c: %0.4f\n', mserr_5c, peaksnr_5c);
fprintf(fileid, 'MSE_6n: %0.4f\tPSNR_6n: %0.4f\n', mserr_6n, peaksnr_6n);
fprintf(fileid, 'MSE_6b: %0.4f\tPSNR_6b: %0.4f\n', mserr_6b, peaksnr_6b);
fprintf(fileid, 'MSE_6c: %0.4f\tPSNR_6c: %0.4f\n', mserr_6c, peaksnr_6c);

fclose(fileid);