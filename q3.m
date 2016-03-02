%% QUESTION 3
% |Given an image x[m, n] with DFT X[k, l], need to determine the effect 
% of the following manipulations on its transform X[k, l].|

%% Reading the Original Image and taking its DFT.
% 

clc;
clear;
close all;

im = imread('../rupee-symbol.jpg');
im = rgb2gray(im);
im = im2double(im);
[h w] = size(im);

im_dft = fftshift(fft2(im));


%% Part (a) - Scaling the function
% x[m,n] -> ax[m,n]
% We need to verify that F[u,v] -> aF[u,v]

im_a = zeros(h,w);
a = 3;
for i = 1:h
    for j = 1:w
        im_a(i,j) = a * im(i,j) ;
    end
end

im_a_dft = fftshift(fft2(im_a)) ;

figure;
imshow(im,[]);
title('Original Image');

figure;
imshow(im_dft);
title('DFT of Original Image');

figure;
imshow(im_a,[]);
title('Transformed Image');

figure;
imshow(im_a_dft);
title('DFT of Transformed Image');

%% 
% Mathematical equations
%
% $$ {f(x,y)} \rightarrow a{f(x,y)}$$
% 
% $$ {F(u,v)}=\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(x,y)}
%   e^{-2j\pi\frac{xu}{M} + \frac{yv}{N} }$$
% 
% $$ a{F(u,v)}=a{\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(x,y)}
%   e^{-2j\pi\frac{xu}{M} + \frac{yv}{N} }}$

%% Part (b) - Scaling the argument
% [m, n] -> [bm, bn]
% We need to verify that F[u,v] -> (F[u/b,v/b])./b^2

b = 2;

new_b_h = h./b;
new_b_w = w./b;

for  i = 1:new_b_h
    for j = 1:new_b_w
        im_b(i,j) = im(b*i , b*j);
    end
end

im_b_dft = fftshift(fft2(im_b));

figure;
imshow(im,[]);
title('Original Image');

figure;
imshow(im_dft);
title('DFT of Original Image');

figure;
imshow(im_b,[]);
title('Transformed Image');

figure;
imshow(im_b_dft);
title('DFT of Transformed Image');

%%
% Mathematical equations
%
% $$ {f(x,y)} \rightarrow {f(ax,ay)}$$
% 
% $$ {F(u,v)}=\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(x,y)}
%   e^{-2j\pi(\frac{xu}{M} + \frac{yv}{N})}$$
% 
% $$ {ax} \rightarrow {p} \Rightarrow {x} \rightarrow {\frac{p}{a}}$$
% 
% $$ {ay} \rightarrow {q} \Rightarrow {y} \rightarrow {\frac{q}{a}}$



%% Part (c) - Shifting the argument
%  [m, n] -> [m + m0 , n + n0 ]
% We need to verify that F[u,v] -> F[u,v] * exp((j*2*pi*(u*m0 + v*n0))/N)

im_c = zeros(h,w);
m0 = 20; 
n0 = 20;

new_c_h = h - m0;
new_c_w = w - n0;
im_c = zeros(h,w);

for  i = 1:new_c_h
    for j = 1:new_c_w
        im_c(i,j) = im(i + m0 , j + n0);
    end
end

im_c_dft = fftshift(fft2(im_c));

figure;
imshow(im,[]);
title('Original Image');

figure;
imshow(im_dft);
title('DFT of Original Image');

figure;
imshow(im_c,[]);
title('Transformed Image');

figure;
imshow(im_c_dft);
title('DFT of Transformed Image');

%%
% Mathematical Equations
%
% $$ {f(x,y)} \rightarrow {f(x+X,y+Y)}$$
% 
% 
% $$ {F(u,v)}=\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(x,y)}
%   e^{-2j\pi(\frac{xu}{M} + \frac{yv}{N})}$$
%
%
% $$ {x+X} \rightarrow {p} \Rightarrow {x} \rightarrow {p-X}$$
%
%
% $$ {y+Y} \rightarrow {q} \Rightarrow {y} \rightarrow {q-Y}$$
%
%
% $$ {F(u,v)e^{2j\pi(\frac{Xu}{M}+\frac{Yv}{N}})}={\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(p,q)}
%   e^{-2j\pi(\frac{(p-X)u}{M} + \frac{(q-Y)v}{Na}) }}$

%% Part (d) - Reflection about a vertical line 
%   x[m, n] -> x[m, N − n]
% We need to verify that F[u,v] -> F[u,v] * exp((j*2*pi*(u*m0 + v*n0))/N)

im_d = zeros(h,w);

for  i = 1:h
    for j = 1:w-1
        im_d(i,j) = im(i, w-j);
    end
end

im_d_dft = fftshift(fft2(im_d));

figure;
imshow(im,[]);
title('Original Image');

figure;
imshow(im_dft);
title('DFT of Original Image');

figure;
imshow(im_d,[]);
title('Transformed Image');

figure;
imshow(im_d_dft);
title('DFT of Transformed Image');

%%
% Mathematical Equations
% 
% $$ {f(x,y)} \rightarrow {f(x,N-y)}$$
% 
% 
% $$ {F(u,v)}=\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(x,y)}
%   e^{-2j\pi(\frac{xu}{M} + \frac{yv}{N})}$$
%
%
% $$ {N-y} \rightarrow {q} \Rightarrow {y} \rightarrow {N-q}$$
%
%
% $$ {F(u,-v)e^{2j\pi(v)}}={\frac{1}{MN}\sum_{x=1}^{M}\sum_{y=1}^{N}{f(p,q)}
%   e^{-2j\pi(\frac{xu}{M} + \frac{(N-q)v}{N}) }}$


    
    
    
    