function [idxTrain,idxTest] = getPartitionIndices(n,holdOut)

idx = (1:n)';
numOfHoldOuts = round(holdOut*n);
withReplacement = false;
idxTest  = randsample(idx,numOfHoldOuts,withReplacement);
idxTrain = setdiff(idx,idxTest);