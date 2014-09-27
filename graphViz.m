[trow, row] = ismember(utmp, unique(src));
[tcol, col] = ismember(utmp, unique(dst));

tmpA = zeros(max(length(trow), length(tcol)), max(length(trow), length(tcol)));

for i = 1:length(row)
    if trow(i) == 1 & tcol(i) == 1
        tmpA(row(i), col(i)) = 1;
    end;
end
s = graphViz4Matlab('-adjMat',tmpA);