clc
close all
clear all

% Mean filter application for Mean_Image1.jpeg
img = imread('Mean_Image1.jpeg');

mean_filter_1_3x3 = compute_mean(img, 3);
imwrite(mean_filter_1_3x3, 'mean_filter_1_3x3.png');

mean_filter_1_5x5 = compute_mean(img, 5);
imwrite(mean_filter_1_5x5, 'mean_filter_1_5x5.png');

mean_filter_1_9x9 = compute_mean(img, 9);
imwrite(mean_filter_1_9x9, 'mean_filter_1_9x9.png');

% Mean filter application for Mean_Image2.jpeg
img = imread('Mean_Image2.jpeg');

mean_filter_2_3x3 = compute_mean(img, 3);
imwrite(mean_filter_2_3x3, 'mean_filter_2_3x3.png');

mean_filter_2_5x5 = compute_mean(img, 5);
imwrite(mean_filter_2_5x5, 'mean_filter_2_5x5.png');

mean_filter_2_9x9 = compute_mean(img, 9);
imwrite(mean_filter_2_9x9, 'mean_filter_2_9x9.png');

% Median filter application for Median_Image1.png
img = imread('Median_Image1.png');

median_filter_1_3x3 = compute_median(img, [3 3]);
imwrite(median_filter_1_3x3, 'median_filter_1_3x3.png');

median_filter_1_5x7 = compute_median(img, [5 7]);
imwrite(median_filter_1_5x7, 'median_filter_1_5x7.png');

median_filter_1_9x11 = compute_median(img, [9 11]);
imwrite(median_filter_1_9x11, 'median_filter_1_9x11.png');

% Median filter application for Median_Image2.png
img = imread('Median_Image2.png');

median_filter_2_3x3 = compute_median(img, [3 3]);
imwrite(median_filter_2_3x3, 'median_filter_2_3x3.png');

median_filter_2_5x7 = compute_median(img, [5 7]);
imwrite(median_filter_2_5x7, 'median_filter_2_5x7.png');

median_filter_2_9x11 = compute_median(img, [9 11]);
imwrite(median_filter_2_9x11, 'median_filter_2_9x11.png');

% Max filter application for Min:Max_Image1.jpeg
img = imread('Min:Max_Image1.jpeg');

max_filter_1_3x3 = compute_max(img, 3);
imwrite(max_filter_1_3x3, 'max_filter_1_3x3.png');

max_filter_1_5x5 = compute_max(img, 5);
imwrite(max_filter_1_5x5, 'max_filter_1_5x5.png');

max_filter_1_7x7 = compute_max(img, 7);
imwrite(max_filter_1_7x7, 'max_filter_1_7x7.png');

% Max filter application for Min:Max_Image2.jpeg
img = imread('Min:Max_Image2.jpeg');

max_filter_2_3x3 = compute_max(img, 3);
imwrite(max_filter_2_3x3, 'max_filter_2_3x3.png');

max_filter_2_5x5 = compute_max(img, 5);
imwrite(max_filter_2_5x5, 'max_filter_2_5x5.png');

max_filter_2_7x7 = compute_max(img, 7);
imwrite(max_filter_2_7x7, 'max_filter_2_7x7.png');

% Min filter application for Min:Max_Image1.jpeg
img = imread('Min:Max_Image1.jpeg');

min_filter_1_3x3 = compute_min(img, 3);
imwrite(min_filter_1_3x3, 'min_filter_1_3x3.png');

min_filter_1_5x5 = compute_min(img, 5);
imwrite(min_filter_1_5x5, 'min_filter_1_5x5.png');

min_filter_1_7x7 = compute_min(img, 7);
imwrite(min_filter_1_7x7, 'min_filter_1_7x7.png');

% Min filter application for Min:Max_Image2.jpeg
img = imread('Min:Max_Image2.jpeg');

min_filter_2_3x3 = compute_min(img, 3);
imwrite(min_filter_2_3x3, 'min_filter_2_3x3.png');

min_filter_2_5x5 = compute_min(img, 5);
imwrite(min_filter_2_5x5, 'min_filter_2_5x5.png');

min_filter_2_7x7 = compute_min(img, 7);
imwrite(min_filter_2_7x7, 'min_filter_2_7x7.png');

