%% Question 1(a)
% |Given the image “vegan.jpg” and a template “soy-dessert.jpg”, implement
% a simple template matching algorithm which slides the template over the image
% and makes comparison at each position using simple absolute sum of difference
% metric for the comparisons and mark a rectangle at the position of minimum
% cost (distance).|

%% Read,downsample and get sizes of the images.
% 

clear;
clc;
close all;

sample = imread('../vegan.jpg');
template = imread('../soy-dessert.jpg');

template_ori_r = size(template,1);
template_ori_c = size(template,2); 

sam = 16;

sample_sm = imresize(sample,1/sam);
template_sm = imresize(template,1/sam);

sample_r = size(sample_sm,1);
sample_c = size(sample_sm,2);

template_r = size(template_sm,1);
template_c = size(template_sm,2);

%% Finding the matched area
%%
% |The template is moved over the image and the position where the
% SAD (sum of absolute differences) is least is taken as the best position
% giving the matched area.|


minsum = 10000000000000000000;

tic;
for i = 1:sample_r - template_r
    for j = 1:sample_c - template_c
        
        sum = 0;
	
	for y = 1:template_c
        for x = 1:template_r
            
            sum = sum + abs(double(sample_sm(i+x,j+y))-double(template_sm(x,y))) ;
            
        end
    end
        if (minsum > sum)
            minsum = sum;
            pos_y = i;
            pos_x = j;
            pos_sum = sum;
        end
    end
end
toc

%% Displaying the Sample,Template,Output
% 

figure, imshow(sample);
title('Sample Image - vegan.jpg');

figure, imshow(template);
title('Template Image - soy-dessert.jpg');

figure, imshow(sample);

pos_x = sam * pos_x;
pos_y = sam * pos_y;

rectangle('position',[pos_x pos_y template_ori_c template_ori_r],'edgecolor','k','LineWidth',2);

rectangle('position',[pos_x pos_y template_ori_c template_ori_r],'edgecolor','w','LineWidth',1)
title('Output Image');        

        
        
     