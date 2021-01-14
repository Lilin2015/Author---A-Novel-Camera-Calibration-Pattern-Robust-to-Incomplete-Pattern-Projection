function [ globalNumPattern ] = AddCol( globalNumPattern, localSize )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global localAllNumAtlas

    if isempty(globalNumPattern)
        globalNumPattern = [];
       return ; 
    end
    [globalNumPatternRow,globalNumPatternCol] = size(globalNumPattern);
    
    globalNumPattern = [globalNumPattern -1*ones(globalNumPatternRow,1)];
    for i = 1:1:globalNumPatternRow
        if i==1
            selRange = intersect(NumRight(globalNumPattern(i,globalNumPatternCol),localSize),localAllNumAtlas);
        else
            selRange = intersect(NumRight(globalNumPattern(i,globalNumPatternCol),localSize),localAllNumAtlas);
            selRange = intersect(NumDown(globalNumPattern(i-1,globalNumPatternCol+1),localSize),selRange);
        end
        if isempty(selRange)
            globalNumPattern = [];
            return;
        end
        selNum = selRange(randi([1,length(selRange)]),1);
        globalNumPattern(i,globalNumPatternCol+1) = selNum;
        localAllNumAtlas = setdiff(localAllNumAtlas,[selNum;NumRot(selNum, localSize)]);
    end
    
end

