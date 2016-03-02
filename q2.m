%% QUESTION 2
% To find orientation of the given text images. 

%% Read the images.
% |The images given are in .gif format. They rotated images have first 
% been converted to .jpg format and then used.|

clc;
clear;
close all;

im_ori = imread('../test-images-for-q2/son3.gif');

%% Converting .gif format to .jpg format.

%%
% |For Rotated Image 1|

[im_rot_temp1,map1] = imread('../test-images-for-q2/son3rot1.gif');
imwrite(im_rot_temp1,map1,'rot1.jpg')
im_rot1 = imread('rot1.jpg');
im_rot1 = im2bw(rgb2gray(im_rot1),0.5);

%%
% |For Rotated Image 2|
[im_rot_temp2,map2] = imread('../test-images-for-q2/son3rot2.gif');
imwrite(im_rot_temp2,map2,'rot2.jpg')
im_rot2 = imread('rot2.jpg');
im_rot2 = im2bw(rgb2gray(im_rot2),0.5);

%%
% |For Rotated Image 3|

[im_rot_temp3,map3] = imread('../test-images-for-q2/son3rot3.gif');
imwrite(im_rot_temp3,map3,'rot3.jpg')
im_rot3 = imread('rot3.jpg');
im_rot3 = im2bw(rgb2gray(im_rot3),0.5);

%% Computing the orientation.
% |The orientation is computed by rotating the original image by a degree
% each time and comparing it with the rotated image.
% The absolute difference is calculated for each degree and the degree 
% for which we get the minimum absolute difference, that is the orientation
% of the rotated image.|
%%
% |For Rotated Image 1|

min_mean = 10000000000000000000000000000000; 

figure, imshow(im_rot1);
title('Rotated Image 1');

tic;
for i = 0:359
    temp = imrotate(im_ori,i,'crop');
    diff_mean = mean2(abs((temp) - uint8(im_rot1)));
    
    if diff_mean < min_mean
        min_mean = diff_mean;
        degree = i;
    end

end
toc

degree
%%
% |For Rotated Image 2|

min_mean = 10000000000000000000000000000000; 

figure, imshow(im_rot2);
title('Rotated Image 2');

tic;
for i = 0:359
    temp = imrotate(im_ori,i,'crop');
    diff_mean = mean2(abs((temp) - uint8(im_rot2)));
    
    if diff_mean < min_mean
        min_mean = diff_mean;
        degree = i;
    end

end
toc

degree

%%
% |For Rotated Image 3|

min_mean = 10000000000000000000000000000000;

figure, imshow(im_rot3);
title('Rotated Image 3');

tic;
for i = 0:359
    temp = imrotate(im_ori,i,'crop');
    diff_mean = mean2(abs((temp) - uint8(im_rot3)));
    
    if diff_mean < min_mean
        min_mean = diff_mean;
        degree = i;
    end

end
toc

degree
        