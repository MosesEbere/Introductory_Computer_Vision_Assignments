function Edge_Detection (img)
tic

% Retain the Original Image for the Plot
I = img;

% First of all, smoothen the image using MATLAB's inbuilt Gaussian filter.
% In the discussion, some results were obtained with applying Gaussian
% filtering first for the sake of comparison. 
I = imgaussfilt(I, 3);

% The row, column, and channels of the image are obtained along with the 
% cardinality of the image. 
[r, c, ch] = size(I);
Card = r*c;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image. 
if (ch == 3)
    I = rgb2gray(I);
end

% Find the Edges using Prewitt, Roberts, Canny, and log
% First Derivative Edge Detectors
P = edge(I, 'Prewitt');
R = edge(I, 'Roberts');
C = edge(I, 'Canny');
% Second Derivative Edge Detector
L = edge(I, 'log');

% Plots - Each image will be in a different figure
figure %1 - Original Image
imshow(img)
title('Original Image')

figure %2
imshow(P)
title('Prewitt Edges')

figure %3
imshow(R)
title('Roberts Edges')

figure %4
imshow(C)
title('Canny Edges')

figure %5
imshow(L)
title('Laplacian of Gaussian Edges')

% Subplots are used to place the above results on the same figure for the
% sake of comparison.
figure %6
subplot(2,2,1)
imshow(P)
title('Prewitt Edges')

subplot(2,2,2)
imshow(R)
title('Roberts Edges')

subplot(2,2,3)
imshow(C)
title('Canny Edges')

subplot(2,2,4)
imshow(L)
title('Laplacian of Gaussian Edges')

toc
end