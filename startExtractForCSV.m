[ flows ] = getDatasetLists( );
format long;
for i = 1:length(flows)
    fi = sprintf('datasets/flows%s.mat', flows{i});
    fo = sprintf('r/r%s.csv', flows{i});
    load(fi);
    disp(fi);
    
    IP = [sIP, dIP];
    IPIdx = find((IP(:,1) >= 131128000000 & IP(:,1) <= 131128255255) & (IP(:,2) < 131128000000 | IP(:,2)     > 131128255255));
    sIPOut = IP(IPIdx, 1);
    dIPOut = IP(IPIdx, 2);
    tmp = [sIPOut';dIPOut'];
    dlmwrite(fo, tmp, 'delimiter', ',', 'precision', 12);
end;