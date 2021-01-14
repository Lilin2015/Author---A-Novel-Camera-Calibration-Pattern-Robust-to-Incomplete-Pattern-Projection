clc;clear;close all;
addpath('./pattern_generate/');
%% Step 1: Choose the already generated pattern prototype
% demo_pattern_prototype_generation.m shows how we generated the pattern
% prototype. In practice, you could directly use our readily generated
% pattern prototypes and translate them into different forms. We consider
% minimum identifying size is the most useful to be 3 or 4, and the maximum
% pattern size is 9 and 33 respectively.

% To use a pattern with min identifying size 3, please uncomment next line.
% load('pattern_prototype_3_9.mat');

% To use a pattern with min identifying size 4, please uncomment next line.
load('pattern_prototype_4_33.mat');

%% Step 2: Configure pattern paremeters

% Meanings of these configurations could be found in README.md.

elePatternSize = 400; %pix
elePatternDist = 60; %pix
globalPatternSizeRow = 15; %number
globalPatternSizeCol = 20; %number
isCheckerboardLike = 0;

%% Step 3: Prepare prototype of feature states 0 or 1

% prototype of feature states should be loaded as images and restored in
% elepattern. Third dimensions of elepattern should be 2, which specifies
% the two distinguishing states. We generated these feature images by
% SVG editor (for example, using Inkscape). These images should be placed in
% the ./ or ./pettern_generate. Several configure examples are given in
% documentations.

% X-junctions saperated by circle (Uncomment following segment to use it)
I = imread('corner.png');
I = imresize(rgb2gray(I),elePatternSize/size(I,1));
elePattern = zeros(elePatternSize,elePatternSize,2);
elePattern(:,:,1) = I;
elePattern(:,:,2) = rot90(I);

% X-junctions saperated by square (Uncomment following segment to use it)
% elePattern(:,:,1) = kron([1 0;0 1],ones(elePatternSize/2,elePatternSize/2));
% elePattern(:,:,2) = kron([0 1;1 0],ones(elePatternSize/2,elePatternSize/2));

% Dot markers on the checkerboard (Uncomment following segment to use it)
% I = imread('dot.png');
% I = imresize(rgb2gray(I),elePatternSize/size(I,1));
% elePattern = zeros(elePatternSize,elePatternSize,2);
% elePattern(:,:,1) = zeros(elePatternSize,elePatternSize);
% elePattern(:,:,2) = imcomplement(I);

%% Step 4: Translate the pattern prototype for use.

% Output:
% globalPattern: 
%       Final pattern image for use. You can use imshow() to inspect it and
%       use it in whatever the way you want.

if globalPatternSizeRow ~= fix(globalPatternSizeRow) || ...
        globalPatternSizeCol ~= fix(globalPatternSizeCol)
    disp(strcat("error: The globalPatternSizeRow and globalPatternSizeCol should be integer!"));
    return;
end

if globalPatternSizeRow < localSize || ...
        globalPatternSizeRow > size(globalMatrix,1) || ...
        globalPatternSizeCol < localSize || ...
        globalPatternSizeCol > size(globalMatrix,1) 
    disp(strcat("error: The globalPatternSizeRow and globalPatternSizeCol should be in range [",string(localSize),", ",string(size(globalMatrix,1)),"]."));
    return;
end

globalPattern = ones(globalPatternSizeRow*elePatternSize+(globalPatternSizeRow-1)*elePatternDist,...
                     globalPatternSizeCol*elePatternSize+(globalPatternSizeCol-1)*elePatternDist);
for i = 1:1:globalPatternSizeRow
   for j = 1:1:globalPatternSizeCol
       if  mod(i+j,2) && isCheckerboardLike
            globalPattern(1+(elePatternSize+elePatternDist)*(i-1):elePatternSize*i+elePatternDist*(i-1),...
                     1+(elePatternSize+elePatternDist)*(j-1):elePatternSize*j+elePatternDist*(j-1))...
               = imcomplement(elePattern(:,:,globalMatrix(i,j)+1));
           
       else
            globalPattern(1+(elePatternSize+elePatternDist)*(i-1):elePatternSize*i+elePatternDist*(i-1),...
                     1+(elePatternSize+elePatternDist)*(j-1):elePatternSize*j+elePatternDist*(j-1))...
               = elePattern(:,:,globalMatrix(i,j)+1);
       end
   end
end
imshow(globalPattern);