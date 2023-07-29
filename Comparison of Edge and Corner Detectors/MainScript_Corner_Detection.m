% Corner Detection

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
Corner_Detection(a)
Corner_Detection(a1)
Corner_Detection(a2)
Corner_Detection(a3)
Corner_Detection(a4)
Corner_Detection(a5)