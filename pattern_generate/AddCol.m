function [ globalNumPattern ] = AddCol( globalNumPattern, localSize )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

