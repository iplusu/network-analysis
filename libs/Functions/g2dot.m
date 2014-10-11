function g2dot(file_name)
    data = sprintf('datasets/%s.mat', file_name);
    disp(data);
    load(data);
    tmp = [srcs; dsts];
    utmp = unique(tmp);
    [trow, row] = ismember(srcs, utmp);
    [tcol, col] = ismember(dsts, utmp);

    %tmpA = zeros(max(length(trow), length(tcol)), max(length(trow), length(tcol)));
    tmpA = sparse(max(max(row), max(col)), max(max(row), max(col)));
    for i = 1:length(row)
        if trow(i) == 1 & tcol(i) == 1
            tmpA(row(i), col(i)) = 1;
        end;
    end
    output = sprintf('dots/%s.dot', file_name);
    disp(output);
    graph_to_dot(tmpA, 'filename', output);
end