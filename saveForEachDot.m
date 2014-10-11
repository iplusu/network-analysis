addpath(genpath('~/username/ychae/network-analysis/libs'));
lists = {'ai', 'cg', 'cn', 'db', 'hpc', 'hu', 'infosec', 'inter', 'se', 'tc'};
len = length(lists);

for i = 1:len
    g2dot(lists{i});
end;
exit;