function [ res ] = getOutDegreeAll( )
%GETOUTDEGREEALL Summary of this function goes here
%   Detailed explanation goes here
    load('datasets/allNetwork.mat');
    
    res = zeros(10,10);
    
    for i = 1:10
        if i == 1
            src = ai_src;
        elseif i == 2
            src = cg_src;
        elseif i == 3
            src = cn_src;
        elseif i == 4
            src = db_src;
        elseif i == 5
            src = hpc_src;
        elseif i == 6
            src = hu_src;
        elseif i == 7
            src = infosec_src;
        elseif i == 8
            src = inter_src;
        elseif i == 9
            src = se_src;
        elseif i == 10
            src = tc_src;
        end;
        
        for j = 1:10
            if j == 1
                dst = ai_dst;
            elseif j == 2
                dst = cg_dst;
            elseif j == 3
                dst = cn_dst;
            elseif j == 4
                dst = db_dst;
            elseif j == 5
                dst = hpc_dst;
            elseif j == 6
                dst = hu_dst;
            elseif j == 7
                dst = infosec_dst;
            elseif j == 8
                dst = inter_dst;
            elseif j == 9
                dst = se_dst;
            elseif j == 10
                dst = tc_dst;
            end;
            
%             if i == j
%                 continue;
%             else
                [tf, idx] = ismember(unique(dst), unique(src));
                res(i, j) = sum(tf);
%             end;
        end;
    end;
end

