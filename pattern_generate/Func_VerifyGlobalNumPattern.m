function [ res ] = Func_VerifyGlobalNumPattern( globalNumPattern, globalSize,localSymmNumAtlas,localSize)
%FUNC_VERIFYGLOBALNUM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

count = 0;
for i = 1:globalSize
    for j = 1:1:globalSize
        if(isempty(intersect(...
                setdiff(NumRot(globalNumPattern(i,j),localSize),globalNumPattern(i,j)),...
                globalNumPattern))...
                &&~ismember(globalNumPattern(i,j),localSymmNumAtlas) )
           count = count + 1; 
        end
    end
end

if count == globalSize^2
    res = 1;
else
    res = 0;
end

end

