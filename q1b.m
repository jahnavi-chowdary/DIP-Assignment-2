%% QUESTION 1(b)
% |Using the same template “soy-dessert.jpg”, applying matching on a new
% image i.e. “vegan-modified.jpg”.|

%% Read,downsample and get sizes of the images.
% 

clear;
clc;
close all;

sample = imread('../vegan-modified.jpg');
template = imread('../soy-dessert.jpg');

sam = 16;

template_ori_r = size(template,1);
template_ori_c = size(template,2); 

sample_sm = imresize(sample,1/sam);
template_sm = imresize(template,1/sam);

sample_r = size(sample_sm,1);
sample_c = size(sample_sm,2);

template_r = size(template_sm,1);
template_c = size(template_sm,2);

%% Finding the matched area
%%
% |The template is moved over the image and the position where the SAD (sum of absolute differences) is least is taken as the best positiongiving the matched area.|


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

%%
% | We do not get the coorect matched area because the new image is not
% uniformly modified which means that the SAD values are not reliable 
% anymore in order to estimate the matched area. Hence a normalized 
% method NCC is implemented to overcome this problem.|

%% Displaying the Sample,Template,Output
% 

figure, imshow(sample);
title('Sample Image - vegan-modified.jpg');

figure, imshow(template);
title('Template Image - soy-dessert.jpg');

figure, imshow(sample);

pos_x = sam * pos_x;
pos_y = sam * pos_y;

rectangle('position',[pos_x pos_y template_ori_c template_ori_r],'edgecolor','k','LineWidth',2);

rectangle('position',[pos_x pos_y template_ori_c template_ori_r],'edgecolor','w','LineWidth',1)
title('Output Image');        
        
        
     