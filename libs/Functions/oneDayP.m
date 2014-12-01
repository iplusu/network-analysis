function [unsIP, Gp] = oneDayP()
% Load all the data
load('datasets/uriData.mat');

sIP = IPFiltered(:,1);
dIP = IPFiltered(:,2);

unsIP = unique(sIP);
undIP = unique(dIP);

[t, nsIP] = ismember(sIP, unsIP);
[t, ndIP] = ismember(dIP, undIP);

tmpA = sparse(nsIP, ndIP, 1);

Gp = 1 * (tmpA * tmpA') > 0;
Sp = speye(length(unsIP));
Gp = Gp - Sp; 
