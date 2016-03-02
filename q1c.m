%% QUESTION 1(c)
% |Use normalized cross correlation (NCC) as the comparison metric to
% perform template matching on “vegan-modified.jpg”.|

%% Read,downsample and get sizes of the images.
% 

clear;
clc;
close all;

sample = imread('../vegan-modified.jpg');
template = imread('../soy-dessert.jpg');

sam = 8;

sample_sm = imresize(sample,1/sam);
template_sm = imresize(template,1/sam);

template_ori_r = size(template,1);
template_ori_c = size(template,2);

sample_r = size(sample_sm,1);
sample_c = size(sample_sm,2);

%% Get no.of elements, Mean ,Variance of the template.
% 

template_r = size(template_sm,1);
template_c = size(template_sm,2);
n = template_r * template_c;
template_mean = mean2(template_sm);
template_std = std2(template_sm);

%% Finding the matched area
%%
% |The template is moved over the image and the position where we get  
% the maximum correlation, that position is taken as the best position
% giving the matched area.|

maxcorr = 0;

tic;
for i = 1:sample_r - template_r 
    for j = 1:sample_c - template_c 
        
        corr = 0;
        temp = sample_sm(i:i+template_r - 1  , j:j+template_c - 1 );
        temp_mean = mean2(temp);
        temp_std = std2(temp);
        
        for y = 1:template_c 
            for x = 1:template_r 
            
                first_term = abs(double(temp(x,y)) - double(temp_mean));
                second_term = abs(double(template_sm(x,y)) - double(template_mean));
                numerator = (first_term) * (second_term);
                denominator = (temp_std) * (template_std);
                
                corr = corr + ((numerator)./(denominator))./n ;
            
            end
        end
        
        if (maxcorr < corr)
            maxcorr = corr;
            pos_y = i;
            pos_x = j;
            pos_sum = corr;
        end
    end
end
toc

%%
% |Since we are using the NCC method, i.e the Normalized Cross Correlstion
% the problem that occured in Question 1(b) has been solved as insted of 
% computing direct absolute difference we are taking the normalized approach.|

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
        