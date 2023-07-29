clear all; close all; clc;

% Read the image to be preprocessed
im = imread('CalibrationRig.jpg');

% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(im);
Card = r*c;

img = im;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image.
if ch == 3
    img = rgb2gray(img);
end

% Find the Harris corners
C_H = detectHarrisFeatures(img, 'MinQuality', 0.4);
imshow(img)
hold on
% Use the following to plot all detected corners
%plot(C_H);
% title('113 Detected Harris Corners; Minimum Quality = 0.4')

N = 35; % Number of selected corners

% Coordinates of the selected corner points from the image
corners = [1015.07 197.849;
           1015.52 586.523;
           1670.91 1526.18;
           2612.77 1850.76;
           3084.11 1901.32;
           2900.62 1508.57;
           2738.39 1327.41;
           2443.12 371.954;
           2194.47 428.608;
           2202.66 727.34;
           1920.74 879.125;
           1798.35 865.796;
           1370.31 820.117;
           1665.87 1186.28;
           1523.53 1183.98;
           1669.33 1354.58;
           1667.23 852.664;
           1519.28 322.695;
           1197.54 428.103;
           1197.16 613.537;
           2323.96 709.427;
           2339.14 1659.43;
           2212.93 1652.87;
           2210.28 1337.98;
           2719.05 641.073;
           2323.27 553.502;
           1908.45 425.628;
           1926.47 1503.11;
           2461.53 1332.38;
           1520.5 492.202;
           1911.85 573.718;
           2605.73 1675.47;
           2466.27 1498.64;
           1665.49 687.469;
           1798    1186.48];
   
% The size of each square is 39.5mm, and the distance from the z-axis to
% the corner of the first square along the x- or y-axis is 9.5mm.
% Corner points in world coordinates
world_coordinate = [286.5   0   355.5;
                    286.5   0   276.5;
                    128.5   0     79;
                     0     168    0;
                     0     286.5  0;
                     0     247    79;
                     0     207.5 118.5;
                     0     128.5 355.5;
                     0     49.5  355.5;
                     0     49.5  276.5;
                    49.5    0    237;
                    89      0    237;
                    207.5   0    237;
                    128.5   0    158;
                    168     0    158;
                    128.5   0    118.5;
                    128.5   0    237;
                    168     0    355.5;
                    247     0    316;
                    247     0    276.5;
                     0     89    276.5;
                     0     89    39.5;
                     0     49.5  39.5;
                     0     49.5  118.5;
                     0     207.5 276.5;
                     0     89    316;
                    49.5    0    355.5;
                    49.5    0    79;
                     0     128.5 118.5;
                    168     0    316;
                    49.5    0    316;
                     0     168   39.5;
                     0     128.5 79;
                    128.5   0    276.5;
                    89      0    158];
                
% Convert the Image Corner Points world coordinates to homogeneous
% coordinates by appending an Nx1 column of ones. 
H_ones = ones(N,1);
H_corners = [corners H_ones];
H_world = [world_coordinate H_ones];

plot(H_corners(:,1),H_corners(:,2),'ro');
title('35 Selected Harris Corners; Minimum Quality = 0.4')

% Create the 2nx12 P-matrix
P = zeros(2*N, 12);

j = 1;
zero_T = zeros(1,4);
for i = 1:2:2*N
    P(i,:) =   [H_world(j,:)    zero_T       -H_corners(j,1)*H_world(j,:)];
    P(i+1,:) = [zero_T       H_world(j,:)    -H_corners(j,2)*H_world(j,:)];
    j = j+1;
end

% Compute the Singular Value Decomposition of P
[U, D, V] = svd(P);

estimated_m = V(:,12);
m1 = transpose(estimated_m(1:4,1));
m2 = transpose(estimated_m(5:8,1));
m3 = transpose(estimated_m(9:12,1));

projection_matrix = [m1; m2; m3];

submatrix_m = projection_matrix(:,1:3);

a1 = submatrix_m(1,1:3);
a2 = submatrix_m(2,1:3);
a3 = submatrix_m(3,1:3);
b = projection_matrix(1:3,4);

% Find the scaling factor since our estimation was only up to scale.
rho = 1/norm(a3);

% Find the intrinsic parameters
u0 = rho^2*dot(a1,a3);
v0 = rho^2*dot(a2,a3);
theta = acos(dot(cross(a1,a3),transpose(cross(a2,a3))) / norm(cross(a1,a3)*norm(cross(a2,a3))));
alpha = rho^2*norm(cross(a1,a3))*sin(theta);
beta = rho^2*norm(cross(a2,a3))*sin(theta);

% Intrinsic parameter matrix, K
K = [alpha  -1*alpha*cot(theta) u0;
     0       beta/sin(theta)    v0;
     0              0           1];

% Find the extrinsic parameters
r1 = (cross(a2,a3)) / norm(cross(a2,a3));
r3 = a3/norm(a3);
r2 = cross(r3,r1);
% Rotation Matrix
R = [r1; r2; r3];
% Translation Vector
T = rho*(K\b);

% These final lines of code are used to obtain the reprojected corners for
% the sake comparison
% check= projection_matrix*H_world';
% x = check(1,:)./check(3,:);
% y = check(2,:)./check(3,:);

% hold on;
% plot(x,y,'y*');
% legend('Original Harris Corners', 'Reprojected Corners')
