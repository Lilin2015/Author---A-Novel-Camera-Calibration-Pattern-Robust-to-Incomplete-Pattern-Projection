function [ globalNumPattern ] = AddRow( globalNumPattern, localSize )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global localAllNumAtlas

    if isempty(globalNumPattern)
        globalNumPattern = [];
       return ; 
    end
    [globalNumPatternRow,globalNumPatternCol] = size(globalNumPattern);
    
    globalNumPattern = [globalNumPattern;-1*ones(1,globalNumPatternCol)];
    for i = 1:1:globalNumPatternCol
        if i==1
            selRange = intersect(NumDown(globalNumPattern(globalNumPatternRow,i),localSize),localAllNumAtlas);
        else
            selRange = intersect(NumRight(globalNumPattern(globalNumPatternRow+1,i-1),localSize),localAllNumAtlas);
            selRange = intersect(NumDown(globalNumPattern(globalNumPatternRow,i),localSize),selRange);
        end
        if isempty(selRange)
            globalNumPattern = [];
            return;
        end
        selNum = selRange(randi([1,length(selRange)]),1);
        globalNumPattern(globalNumPatternRow+1,i) = selNum;
        localAllNumAtlas = setdiff(localAllNumAtlas,[selNum;NumRot(selNum, localSize)]);
    end

end

