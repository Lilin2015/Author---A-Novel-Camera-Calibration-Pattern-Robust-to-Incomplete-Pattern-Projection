function [ row,col,rot ] = LocalMatrix2Pos( localMatrix, globalNumPattern )
%LOCAL2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

localSize = size(localMatrix,1);
localNum = bin2dec(num2str(reshape(localMatrix,localSize^2,1))');
rotArray = NumRot( localNum, localSize );
rot = find(ismember(rotArray,globalNumPattern)==1);

if isempty(rot)||numel(rot)>1
    row = -1;
    col = -1;
    rot = -1;
else
    [row,col] = find(globalNumPattern==rotArray(rot));
end

end

