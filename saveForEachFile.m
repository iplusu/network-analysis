lists = {'ai', 'cg', 'cn', 'db', 'hpc', 'hu', 'infosec', 'inter', 'se', 'tc'};
len = length(lists);
load('datasets/allNetwork.mat');
src = ai_src;
dst = ai_dst;

for i=1:10
    switch i
        case 1
            srcs = ai_src;
            dsts = ai_dst;
        case 2
            srcs = cg_src;
            dsts = cg_dst;
        case 3
            srcs = cn_src;
            dsts = cn_dst;
        case 4
            srcs = db_src;
            dsts = db_dst;
        case 5
            srcs = hpc_src;
            dsts = hpc_dst;
        case 6
            srcs = hu_src;
            dsts = hu_dst;
        case 7
            srcs = infosec_src;
            dsts = infosec_dst;
        case 8
            srcs = inter_src;
            dsts = inter_dst;
        case 9
            srcs = se_src;
            dsts = se_dst;
        case 10
            srcs = tc_src;
            dsts = tc_dst;
    end;
    destination = sprintf('datasets/%s.mat', lists{i});
    disp(destination);
    save(destination, 'srcs', 'dsts');
end;