[ flows ] = getDatasetLists( );
[uFromSIP, uFromDIP, uToSIP, uToDIP] = extractUniqueIP();
uFromIP = unique([uFromSIP;uFromDIP]);
uToIP = unique([uToSIP;uToDIP]);
uIP = unique([uFromIP; uToIP]);

format long;
for i = 1:length(flows)
    fi = sprintf('datasets/flows%s.mat', flows{i});
    fo = sprintf('r/r%s.csv', flows{i});
%     fosrc = sprintf('r/rFrom%ssrc.csv', flows{i});
%     fodst = sprintf('r/rFrom%sdst.csv', flows{i});
    load(fi);
    disp(fi);
    
    IP = [sIP, dIP];
%     IPIdx = find((IP(:,1) >= 131128000000 & IP(:,1) <= 131128255255) & (IP(:,2) < 131128000000 | IP(:,2) > 131128255255));
%     sIPOut = IP(IPIdx, 1);
%     dIPOut = IP(IPIdx, 2);
    
%     [t, nsIP] = ismember(sIPOut, uFromIP);
%     [t, ndIP] = ismember(dIPOut, uFromIP);
    [t, nsIP] = ismember(IP(IPIdx, 1), uIP);
    [t, ndIP] = ismember(IP(IPIdx, 2), uIP);
    
     tmp = [nsIP ndIP];
     dlmwrite(fo, tmp, 'delimiter', ',', 'precision', 12);
%     dlmwrite(fosrc, nsIP, 'delimiter', ',', 'precision', 12);
%     dlmwrite(fodst, ndIP, 'delimiter', ',', 'precision', 12);
end;