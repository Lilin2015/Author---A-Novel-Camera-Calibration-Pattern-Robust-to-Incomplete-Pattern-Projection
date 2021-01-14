function [ globalNumPattern ] = Func_GlobalNumPattern( globalSize,localSize )
%GLOBALNUMPATTERN 此处显示有关此函数的摘要
%   此处显示详细说明
global localAllNumAtlas
if globalSize==1
    selNum = localAllNumAtlas(randi([1,length(localAllNumAtlas)]));
    globalNumPattern = [selNum];
    localAllNumAtlas = setdiff(localAllNumAtlas,[selNum;NumRot(selNum, localSize)]);
else
    globalNumPattern = GlobalNumPattern( globalSize-1,localSize);
    if isempty(globalNumPattern)
        globalNumPattern = [];
       return ; 
    end
    globalNumPattern = [globalNumPattern -1*ones(globalSize-1,1)];
    for i = 1:1:globalSize-1
        if i==1
            selRange = intersect(NumRight(globalNumPattern(i,globalSize-1),localSize),localAllNumAtlas);
        else
            selRange = intersect(NumRight(globalNumPattern(i,globalSize-1),localSize),localAllNumAtlas);
            selRange = intersect(NumDown(globalNumPattern(i-1,globalSize),localSize),selRange);
        end
        if isempty(selRange)
            globalNumPattern = [];
            return;
        end
        selNum = selRange(randi([1,length(selRange)]),1);
        globalNumPattern(i,globalSize) = selNum;
        globalNumPattern
        localAllNumAtlas = setdiff(localAllNumAtlas,[selNum;NumRot(selNum, localSize)]);
    end
    globalNumPattern = [globalNumPattern;-1*ones(1,globalSize)];
    for i = 1:1:globalSize
        if i==1
            selRange = intersect(NumDown(globalNumPattern(globalSize-1,i),localSize),localAllNumAtlas);
        else
            selRange = intersect(NumRight(globalNumPattern(globalSize,i-1),localSize),localAllNumAtlas);
            selRange = intersect(NumDown(globalNumPattern(globalSize-1,i),localSize),selRange);
        end
        if isempty(selRange)
            globalNumPattern = [];
            return;
        end
        selNum = selRange(randi([1,length(selRange)]),1);
        globalNumPattern(globalSize,i) = selNum;
        globalNumPattern
        localAllNumAtlas = setdiff(localAllNumAtlas,[selNum;NumRot(selNum, localSize)]);
    end
end

end

