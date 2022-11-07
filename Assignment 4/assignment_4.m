close all
clear all
clc

img = rgb2gray(imread('axones2.png'));

im_avg = filter2(fspecial('average',3), img)/255;
im_med = medfilt2(img);
im_wien = wiener2(img, [5 5]);

figure('Name', 'average')
montage({img, im_avg});
title('Original image vs. denoised with average filter');

figure('Name', 'median')
montage({img, im_med});
title('Original image vs. denoised with median filter');

figure('Name', 'wiener')
montage({img, im_wien});
title('Original image vs. denoised with Wiener filter');

figure('Name', 'denoise_collage');
montage({im_avg, im_med, im_wien});

im_filt = im_avg;

[~, sobel_t] = edge(im_filt, 'sobel');
sobel_f = 2.6;
im_sobel = im2uint8(edge(im_filt, 'sobel', sobel_t * sobel_f));
figure('Name', 'sobel')
imshow(im_sobel);
title('Sobel edge detection');
drawnow

[~, prewitt_t] = edge(im_filt, 'prewitt');
prewitt_f = 2.6;
im_prewitt = im2uint8(edge(im_filt, 'prewitt', prewitt_t * prewitt_f));
figure('Name', 'prewitt')
imshow(im_prewitt);
title('Prewitt edge detection');
drawnow

[~, rob_t] = edge(im_filt, 'roberts');
rob_f = 2.3;
im_rob = im2uint8(edge(im_filt, 'roberts', rob_t * rob_f));
figure('Name', 'roberts')
imshow(im_rob);
title('Roberts edge detection');
drawnow

[~, canny_t] = edge(im_filt, 'canny');
canny_f = 6.5;
im_canny = im2uint8(edge(im_filt, 'canny', canny_t * canny_f));
figure('Name', 'canny')
imshow(im_canny);
title('Canny edge detection');
drawnow

figure('Name', 'edge_collage')
montage({im_sobel, im_prewitt, im_rob, im_canny});
drawnow

im_edge = im_canny;

bmatrix = [0 1 0; 1 1 1; 0 1 0];
im_dil = imdilate(im_edge, bmatrix);
im_fil = imfill(im_dil, 'holes');
se = strel('disk', 150);
im_clo = imclose(im_fil, se);

figure('Name', 'closed')
imshow(im_clo);
title('Filled image');
drawnow

level = graythresh(im_clo);
im_bin = imbinarize(im_clo, level);
figure('Name', 'binarized')
imshow(im_bin);
title('Binarized image with Otsu''s method');
drawnow

im_skel = bwskel(im_bin);
figure('Name', 'skeletonized')
imshow(im_skel);
title('Skeletonized image through bwskel');
drawnow

figure('Name', 'final')
imshow(labeloverlay(img, im_skel, 'Colormap', 'autumn', 'Transparency', 0));
title('Skeleton over original image');

FolderName = pwd;
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = get(FigHandle, 'Name');
  saveas(FigHandle, fullfile(FolderName, [FigName, '.png']));
end