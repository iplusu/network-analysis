function [ nodeList ] = extractUniqueNodes( )
%EXTRACTUNIQUEEDGES Summary of this function goes here
%   Detailed explanation goes here
    [ flows ] = getDatasetLists( );
    nodeList = [];
    for i = 1:length(flows)
        fi = sprintf('datasets/flows%s.mat', flows{i});
        load(fi);
        disp(fi);

        nodeList = [nodeList; sIP; dIP];
        nodeList = unique(nodeList);
    end;
end

