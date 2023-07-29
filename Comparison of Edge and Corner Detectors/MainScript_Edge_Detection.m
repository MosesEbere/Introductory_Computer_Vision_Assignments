% Edge Detection

clear all
clc

% Read the images whose edges will be detected
a = imread('bridge.jpg');
a1 = imread('building.jpg');
a2 = imread('beach.jpg');
a3 = imread('library.jpg');
a4 = imread('lego1.jfif');
a5 = imread('steps.jpg');

% Call the Edge Detection Function
Edge_Detection(a)
Edge_Detection(a1)
Edge_Detection(a2)
Edge_Detection(a3)
Edge_Detection(a4)
Edge_Detection(a5)