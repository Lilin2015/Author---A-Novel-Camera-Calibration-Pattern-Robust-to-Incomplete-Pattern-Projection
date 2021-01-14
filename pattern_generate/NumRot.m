function [ rotArray ] = NumRot( num, localSize )
%NUM2LOCALARRAY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   ����ֵ��ʽ
%   [��ת, ת90, ת180, ת270, ��ɫ��ת, ��ɫת90, ��ɫת180, ��ɫת270]

strBin = dec2bin(num,localSize^2);
localMatrix = reshape(str2num(strBin(:)),localSize,localSize);
%
rLocalMatrix = 1-localMatrix;
rNum  =  bin2dec(num2str(reshape(rLocalMatrix,localSize^2,1))');

localMatrixRot90 = rot90(1-localMatrix);
numRot90  =  bin2dec(num2str(reshape(localMatrixRot90,localSize^2,1))');
%
rLocalMatrixRot90 = rot90(localMatrix);
rNumRot90  =  bin2dec(num2str(reshape(rLocalMatrixRot90,localSize^2,1))');

localMatrixRot180 = rot90(1-localMatrixRot90);
numRot180 =  bin2dec(num2str(reshape(localMatrixRot180,localSize^2,1))');
%
rLocalMatrixRot180 = rot90(localMatrixRot90);
rNumRot180 =  bin2dec(num2str(reshape(rLocalMatrixRot180,localSize^2,1))');

localMatrixRot270 = rot90(1-localMatrixRot180);
numRot270 =  bin2dec(num2str(reshape(localMatrixRot270,localSize^2,1))');
%
rLocalMatrixRot270 = rot90(localMatrixRot180);
rNumRot270 =  bin2dec(num2str(reshape(rLocalMatrixRot270,localSize^2,1))');

rotArray = [num;numRot90;numRot180;numRot270;rNum;rNumRot90;rNumRot180;rNumRot270];
% rotArray = [num;numRot90;numRot180;numRot270];
end

