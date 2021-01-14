clc;clear;close all;

loadData;
load('patternInfo.mat');
squareSize = 11.7;% mm

tic;
featurePoints = cell(camNum,picNum);
% for i = 1:1:camNum
%    parfor j = 1:1:picNum
i = 3;j = 27;
        tic;
        try
            I = imread(strcat(filePath,cameraMAC(i,:),'\',data(i,j).name));
            [corners] = detectImage( 3*I,globalNumPattern,localSize, squareSize);
            featurePoints{i,j} = corners;
        catch
            
        end
        toc;
        [i j]
%     end
% end
toc;
