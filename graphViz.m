tmp = [src;dst];
utmp = unique(tmp);
[trow, row] = ismember(src, utmp);
[tcol, col] = ismember(dst, utmp);

%tmpA = zeros(max(length(trow), length(tcol)), max(length(trow), length(tcol)));
tmpA = sparse(max(max(row), max(col)), max(max(row), max(col)));
for i = 1:length(row)
    if trow(i) == 1 & tcol(i) == 1
        tmpA(row(i), col(i)) = 1;
    end;
end
s = graphViz4Matlab('-adjMat',tmpA);