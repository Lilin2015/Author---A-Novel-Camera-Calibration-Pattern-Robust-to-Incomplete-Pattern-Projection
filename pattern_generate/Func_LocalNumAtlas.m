function [ localNumAtlas,localSymmNumAtlas ] = Func_LocalNumAtlas( localSize )
%LOCALNUMATLAS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

localArea = localSize^2;

localNumAtlas = [];
localSymmNumAtlas = [];
localNumRec = 0:1:2^(localArea)-1;
for i = 0:1:2^(localArea)-1
    idxRep = NumRot(i,localSize);
    if numel(unique(idxRep(1:4)))~= 4
        localSymmNumAtlas = [localSymmNumAtlas;i];
    else
        if localNumRec(i+1)~=-1
            if ~isempty(idxRep)
                localNumRec(idxRep+1) = -1;
            end
            localNumAtlas = [localNumAtlas;i];
        end
    end

end

end

