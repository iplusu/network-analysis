function [unsIP, undIP, d_Gb] = oneDayD()
% Load all the data
load('datasets/uriData.mat');

sIP = IPFiltered(:,1);
dIP = IPFiltered(:,2);

unsIP = unique(sIP);
undIP = unique(dIP);

[t, nsIP] = ismember(sIP, unsIP);
[t, ndIP] = ismember(dIP, undIP);

tmpA = sparse(nsIP, ndIP, 1);
d_Gb = sum(tmpA > 0, 2);
d_Gb = full(d_Gb);