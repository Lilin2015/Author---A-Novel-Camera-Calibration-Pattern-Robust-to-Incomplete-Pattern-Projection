function [ globalPattern ] = Func_PatternGeneration( elePattern,localSize, elePatternSize, elePatternDist, globalPatternSizeRow, globalPatternSizeCol, isCheckerboardLike)
%FUNC_APP 此处显示有关此函数的摘要
%   此处显示详细说明

addpath('./pattern_generate/');

%% Step 1: Choose the already generated pattern prototype
% demo_pattern_prototype_generation.m shows how we generated the pattern
% prototype. In practice, you could directly use our readily generated
% pattern prototypes and translate them into different forms. We consider
% minimum identifying size is the most useful to be 3 or 4, and the maximum
% pattern size is 9 and 33 respectively.
if localSize == 3
    load('pattern_prototype_3_9.mat');
elseif localSize == 4
    load('pattern_prototype_4_33.mat');
else
    
end
      
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



end

