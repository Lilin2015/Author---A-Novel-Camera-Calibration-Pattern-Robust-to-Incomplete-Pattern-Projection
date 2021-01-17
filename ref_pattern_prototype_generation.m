clc;clear;close all;

addpath('./pattern_generate/');

% size of minimum recognize size
localSize = 3;
% area of minimum recognize size, for length of binary representation
localArea = localSize^2; 
% size of the whole pattern (this program generates square pattern)
globalSize = 9; 

%% Step 1: List all the identifying units and equivalent class.

% Generally speaking, localSize is chosen to be 3 or 4,or the normal CPU 
% cannot afford the computational cost in this program;

% Output:
% localNumAtlas: 
%       Representative elements set of rotating equavalent classes.
% localSymmNumAtlas: 
%       the set of decimal representations of all the minimum recognizing 
%       units with rotating symmetric.

[ localNumAtlas,localSymmNumAtlas ] = Func_LocalNumAtlas(localSize);

%% Step 2: Generate the pattern in decimal representation.

% Func_GlobalNumPattern is designed to be recursively executed, thus the 
% global variants localAllNumAtlas are used to record all available minimum
% recognizing units candidates.
% Note: Here the demo tres to search an available pattern without stop before
% sucess, therefore these code should be paused manually when the code
% runs for too long without a result!

% Output:
% globalNumPattern: 
%       Available pattern result. Each identifying units is represented 
%       with a decimal number following the Fig. 3 of the article.

global localAllNumAtlas
globalNumPattern = [];
while isempty(globalNumPattern)
    % Exclude minimum identifying units with rot. symm. in advanced.
    localAllNumAtlas = setdiff(0:1:2^localArea-1,localSymmNumAtlas);
    globalNumPattern  = Func_GlobalNumPattern( globalSize,localSize )
end

%% (Optional) Verification

% Verifing whether each identifying unit of the generated pattern belong to
% the different equivalent class.

% Output:
%       res == 1 means each identifying unit of the generated pattern belong
%                to the different equivalent class.
%       res == 0 means ambiguities exist.

res = Func_VerifyGlobalNumPattern( globalNumPattern, globalSize,localSymmNumAtlas,localSize);

%% Step 3: Translate the pattern from decimal to binarary representation

% Input:
% globalNumPattern: 
%       Decimal pattern prototype. Each identifying units is represented 
%       with a decimal number following the Fig. 3 of the article.
% Output:
% globalMatrix: 
%       Binary pattern prototype, in which the state of each feature is
%       specified as 0 or 1. The size of the globalMatrix is
%       globalSize + localSize - 1.

globalMatrix = -1*ones(globalSize+localSize-1);
for i = 1:1:globalSize
    for j = 1:1:globalSize
        if i==1&&j==1
            globalMatrix(1:localSize,1:localSize) = Num2LocalMatrix(globalNumPattern(1,1),localSize);
        elseif i==1&&j>1
            localMatrix = Num2LocalMatrix(globalNumPattern(i,j),localSize);
            globalMatrix(1:localSize,localSize-1+j) = localMatrix(:,localSize);
        elseif i>1&&j==1
            localMatrix = Num2LocalMatrix(globalNumPattern(i,j),localSize);
            globalMatrix(localSize-1+i,1:localSize) = localMatrix(localSize,:);
        else
            localMatrix = Num2LocalMatrix(globalNumPattern(i,j),localSize);
            globalMatrix(localSize-1+i,localSize-1+j) = localMatrix(localSize,localSize);
        end
    end 
end
