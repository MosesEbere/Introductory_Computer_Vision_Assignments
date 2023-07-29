function Corner_Detection (img)
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

% Detect the Corners
% Using Corner function
C_H = corner(I, 'Harris');
C_M = corner(I, 'MinimumEigenvalue');
% Using Functions from the Computer Vision Toolbox
H = detectHarrisFeatures(I);
ME = detectMinEigenFeatures(I);

% Plots - Each image will be in a different figure
figure %1 - Original Image
imshow(img)
title('Original Image')

figure %2
imshow(img)
hold on
plot(C_H(:,1),C_H(:,2),'r*');
title('Corner Detection Using Corner Function')
xlabel('Method - Harris')

figure %3
imshow(img)
hold on
plot(C_M(:,1),C_M(:,2),'r*');
title('Corner Detection Using Corner Function');
xlabel('Method - MinimumEigenvalues')

figure %4
imshow(img)
hold on;
plot(H.selectStrongest(100));
title('Harris Corner Detection Using detectHarrisFeatures')

figure %5
imshow(img)
hold on;
plot(ME.selectStrongest(100));
title('Kanade-Tomasi Corner Detection Using MinEigenFeatures')

% Subplots are used to place the above results on the same figure for the
% sake of comparison.
figure %6
subplot(2,2,1)
imshow(img)
hold on
plot(C_H(:,1),C_H(:,2),'r*');
title('Corner Detection Using Corner Function (Method - Harris)')

subplot(2,2,2)
imshow(img)
hold on
plot(C_M(:,1),C_M(:,2),'r*');
title('Corner Detection Using Corner Function (Method - MinimumEigenvalues)');

subplot(2,2,3)
imshow(img)
hold on;
plot(H.selectStrongest(100));
title('Harris Corner Detection Using detectHarrisFeatures')

subplot(2,2,4)
imshow(img)
hold on;
plot(ME.selectStrongest(100));
title('Kanade-Tomasi Corner Detection Using MinEigenFeatures')

toc
end