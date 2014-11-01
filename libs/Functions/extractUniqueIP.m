% Clean the workspace
% function [unsIPFlows, unsIPThreats, unsIPURI] = extractSIP()
function [uFromSIP, uFromDIP, uToSIP, uToDIP] = extractUniqueIP()

    [ flows ] = getDatasetLists( );
    uFromSIP = [];
    uFromDIP = [];
    uToSIP = [];
    uToDIP = [];
    
    for i = 1:length(flows)
        dataset = sprintf('datasets/flows%s.mat', flows{i});
        load(dataset);
        
        IP = [sIP, dIP];
        IPIdx = find((IP(:,1) >= 131128000000 & IP(:,1) <= 131128255255) & (IP(:,2) < 131128000000 | IP(:,2) > 131128255255));
        uFromSIP = [uFromSIP; IP(IPIdx, 1)];
        uFromDIP = [uFromDIP; IP(IPIdx, 2)];
        uFromSIP = unique(uFromSIP);
        uFromDIP = unique(uFromDIP);
        
        IPIdx = find((IP(:,1) < 131128000000 | IP(:,1) > 131128255255) & (IP(:,2) >= 131128000000 & IP(:,2) <= 131128255255));
        uToSIP = [uToSIP; IP(IPIdx, 1)];
        uToDIP = [uToDIP; IP(IPIdx, 2)];
        uToSIP = unique(uToSIP);
        uToDIP = unique(uToDIP);
    end;
end
% 
% for i = 1:length(threats)
%     dataset = sprintf('datasets/threats%s', flows{i});
%     load(dataset);
% %     [sIP, dIP] = removeIP(sIP, dIP, 2439063451);
% %     [sIP, dIP] = removeIP(sIP, dIP, 2439063452);
%     
%     unsIPThreats = [unsIPThreats;sIP];
%     unsIPThreats = unique(unsIPThreats);
% end;    
% 
% for i = 1:length(uri)
%     dataset = sprintf('datasets/uri%s', flows{i});
%     load(dataset);
% %     [sIP, dIP] = removeIP(sIP, dIP, 2439063451);
% %     [sIP, dIP] = removeIP(sIP, dIP, 2439063452);
%     
%     unsIPURI = [unsIPURI;sIP];
%     unsIPURI = unique(unsIPURI);
% end;    
