function [ edgeList ] = extractUniqueEdges( )
%EXTRACTUNIQUEEDGES Summary of this function goes here
%   Detailed explanation goes here
    [ flows ] = getDatasetLists( );
    edgeList = [];
    for i = 1:length(flows)
        fi = sprintf('datasets/flows%s.mat', flows{i});
        load(fi);
        disp(fi);

        IP = [sIP, dIP];
        edgeList = [edgeList; IP];
        edgeList = unique(edgeList, 'rows');
    end;
end

