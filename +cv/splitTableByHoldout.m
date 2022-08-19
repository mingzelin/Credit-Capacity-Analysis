function [Ttrain,Ttest] = splitTableByHoldout(T,holdoutPCT)

%% Input checking
if nargin == 0
    T = table();
    T.c1 = randn(100,1);
    T.c2 = randn(100,1);
    holdoutPCT = 0.3;
end

%% Get split indices
[idxTrain,idxTest] = cv.getPartitionIndices(height(T),holdoutPCT);

%% Split Data
Ttrain = T(idxTrain,:);
Ttest  = T(idxTest,:);