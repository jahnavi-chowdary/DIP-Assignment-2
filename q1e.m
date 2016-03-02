%% QUESTION 1(e)
%  Implementation with â€œnormxcorr2â€? function in matlab

%% Read, take size of template, Compute NCC using normxcorr2
% 

clc;
clear;
close all;

sample = imread('../vegan-modified.jpg');
template = imread('../soy-dessert.jpg');

template_r = size(template,1);
template_c = size(template,2);

tic;
final =  normxcorr2(template, sample);
toc
%% Get Positions of the matched area
% 


[ypeak, xpeak] = find(final==max(final(:)));
pos_y = ypeak-size(template,1);
pos_x = xpeak-size(template,2);

%% Displaying the Sample, Template, Output
% 

figure, imshow(sample);
title('Sample Image - vegan-modified.jpg');

figure, imshow(template);
title('Template Image - soy-dessert.jpg');


figure, imshow(sample);
rectangle('position',[pos_x pos_y template_c template_r],'edgecolor','k','LineWidth',2);

rectangle('position',[pos_x pos_y template_c template_r],'edgecolor','w','LineWidth',1)
title('Output Image');
