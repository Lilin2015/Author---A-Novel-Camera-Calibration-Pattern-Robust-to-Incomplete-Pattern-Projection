function [ rightArray ] = NumRight( num, localSize )
%NUM2LOCALARRAY 此处显示有关此函数的摘要
%   此处显示详细说明

strBin = dec2bin(num,localSize^2);
localMatrix = reshape(str2num(strBin(:)),localSize,localSize);
rightArray = -1*ones(2^localSize,1);
for i = 0:1:2^localSize-1
    rightBin = dec2bin(i,localSize);
    rightCol = str2num(rightBin(:));
    rightMatrix = [localMatrix(:,2:localSize) rightCol];
    rightArray(i+1,1) = bin2dec(num2str(reshape(rightMatrix,localSize^2,1))');
end

end

