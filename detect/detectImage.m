function [corners] = detectImage( I,globalNumPattern,localSize,squareSize )
%DETECTIMAGE 此处显示有关此函数的摘要
%   此处显示详细说明

corners = findCorners(I,0.01,1);
[~,records]= chessboardsFromCornersFull(corners);

globalSize = size(globalNumPattern,1);
globalPointMatrix = zeros((globalSize+localSize-1),(globalSize+localSize-1));

for i = 1:1:size(records,2)
    if ~isempty(records{1,i})
        if size(records{1,i},1)<localSize || size(records{1,i},2)<localSize
           continue; 
        end
         [ row,col,rot ] = LocalMatrix2Pos( ...
                corners.value(records{1,i}(1:localSize,1:localSize)),...
                globalNumPattern );
            for k = 1:1:rem((rot-1),4)
                records{1,i} = rot90(records{1,i});
            end
            [ row,col,rot ] = LocalMatrix2Pos( ...
                corners.value(records{1,i}(1:localSize,1:localSize)),...
                globalNumPattern );
            if row == -1
               continue; 
            end
            globalPointMatrix(row:(row+size(records{1,i},1)-1),...
                col:(col+size(records{1,i},2))-1) = records{1,i};
    end
end

corners = rmfield(corners,{'v1','v2','score'});
corners.idx = setdiff(unique(globalPointMatrix),0);
corners.p = corners.p(corners.idx,:);
corners.value = corners.value(corners.idx,:);
for i = 1:1:size(corners.p,1)
    corners.idx(i,1) = find(globalPointMatrix==corners.idx(i,1));
end

% worldPoints = generateCheckerboardPoints(size(globalNumPattern)+localSize, squareSize);

% corners.world = worldPoints(corners.idx,:);

end

