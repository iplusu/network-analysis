listing = dir('extract');
for idx = 1:length(listing)
    str1 = listing(idx).name;
    if strcmp(str1, '.') || strcmp(str1, '..')
        disp(str1);
        continue;
    end;
    loadExtract = sprintf('extract/%s', str1);
    
    [numData, t2, locData] = xlsread(loadExtract);
    locData(1, :) = [];
    sIP = numData(:, 1);
    sPort = numData(:, 2);
    dIP = numData(:, 3);
    dPort = numData(:, 4);
    sTime = numData(:, 5);
    loc = locData(:, 6);
    
    str1 = strsplit(str1, '-');
    str2 = strsplit(str1{5}, '_');
    
    saveFile = sprintf('datasets/%s%s%s.mat', str1{1}, str1{4}, str2{1});
    disp(saveFile);
    save(saveFile, 'sIP', 'sPort', 'dIP', 'dPort', 'sTime', 'loc');
    clearvars -except listing idx;
end;