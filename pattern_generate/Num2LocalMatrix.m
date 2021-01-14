function [ localMatrix ] = Num2LocalMatrix( num,localSize )
%NUM2BOOLMATRIX 此处显示有关此函数的摘要
%   此处显示详细说明

strBin = dec2bin(num,localSize^2);
localMatrix = reshape(str2num(strBin(:)),localSize,localSize);

end

