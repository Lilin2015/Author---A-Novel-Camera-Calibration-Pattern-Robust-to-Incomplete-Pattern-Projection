function [ localMatrix ] = Num2LocalMatrix( num,localSize )
%NUM2BOOLMATRIX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

strBin = dec2bin(num,localSize^2);
localMatrix = reshape(str2num(strBin(:)),localSize,localSize);

end

