clc;clear;close all;
addpath('./pattern_generate/');

%% Step 1: Choose localSize
% demo_pattern_prototype_generation.m shows how we generated the pattern
% prototype. In practice, you could directly use our readily generated
% pattern prototypes and translate them into different forms. We consider
% minimum identifying size is the most useful to be 3 or 4, and the maximum
% pattern size is 9 and 33 respectively.
localSize = 4;

%% Step 2: Choose configurations
% Meanings of these configurations could be found in README.md. Here
% provides 3 configurations for reference.

% prototype of feature states should be loaded as images and restored in
% elepattern. Third dimensions of elepattern should be 2, which specifies
% the two distinguishing states. We generated these feature images by
% SVG editor (for example, using Inkscape). These images should be placed in
% the ./ or ./pettern_generate. Several configure examples are given in
% documentations.

% *************************************************************************
% X-junctions saperated by circle (Uncomment following segment to use it)
% *************************************************************************

elePatternDist = 60; %pix
globalPatternSizeRow = 28; %number
globalPatternSizeCol = 19; %number
isCheckerboardLike = 0;

I = rgb2gray(imread('corner.png'));
elePatternSize = size(I,1); %pix
elePattern = zeros(elePatternSize,elePatternSize,2);
elePattern(:,:,1) = I;
elePattern(:,:,2) = rot90(I);


% *************************************************************************
% X-junctions saperated by square (Uncomment following segment to use it)
% *************************************************************************
% elePatternSize = 400; %pix
% elePatternDist = 60; %pix
% globalPatternSizeRow = 15; %number
% globalPatternSizeCol = 20; %number
% isCheckerboardLike = 0;
% 
% elePattern(:,:,1) = kron([1 0;0 1],ones(elePatternSize/2,elePatternSize/2));
% elePattern(:,:,2) = kron([0 1;1 0],ones(elePatternSize/2,elePatternSize/2));


% *************************************************************************
% Dot markers on the checkerboard (Uncomment following segment to use it)
% *************************************************************************

% I = imread('dot.png');
% I = imresize(rgb2gray(I),elePatternSize/size(I,1));
% elePattern = zeros(elePatternSize,elePatternSize,2);
% elePattern(:,:,1) = zeros(elePatternSize,elePatternSize);
% elePattern(:,:,2) = imcomplement(I);
% 
% elePatternSize = 400; %pix
% elePatternDist = 0; %pix
% globalPatternSizeRow = 15; %number
% globalPatternSizeCol = 20; %number
% isCheckerboardLike = 0;

%% Step 3: Generate pattern

globalPattern = Func_PatternGeneration( elePattern,localSize, elePatternSize, elePatternDist, globalPatternSizeRow, globalPatternSizeCol, isCheckerboardLike);

imwrite(globalPattern,'./pattern.png');
imshow(globalPattern);