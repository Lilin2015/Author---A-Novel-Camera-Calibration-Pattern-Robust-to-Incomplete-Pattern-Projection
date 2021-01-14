function [ downArray ] = NumDown( num, localSize )
%NUM2LOCALARRAY 此处显示有关此函数的摘要
%   此处显示详细说明

strBin = dec2bin(num,localSize^2);
localMatrix = reshape(str2num(strBin(:)),localSize,localSize);
downArray = -1*ones(2^localSize,1);
for i = 0:1:2^localSize-1
    downBin = dec2bin(i,localSize);
    downRow = str2num(downBin(:))';
    downMatrix = [localMatrix(2:localSize,:) ;downRow];
    downArray(i+1,1) = bin2dec(num2str(reshape(downMatrix,localSize^2,1))');
end

end

