function [ globalNumPattern ] = AddRow( globalNumPattern, localSize )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

