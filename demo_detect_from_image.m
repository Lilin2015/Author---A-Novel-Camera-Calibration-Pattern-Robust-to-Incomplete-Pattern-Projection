clc;clear;close all;

addpath('detect');
addpath('pattern_generate');
load('pattern_prototype_4_33.mat');

I = imread('.\data\image_303_abb.jpg');
squareSize = 12.5;% mm

[corners] = Func_DetectImage( I,globalNumPattern,localSize, squareSize);

J = insertText(I, corners.p, corners.idx,'FontSize',20,'AnchorPoint','RightBottom');
J = insertMarker(J, corners.p, 'o', 'Color', 'red', 'Size', 8);
imshow(J);
