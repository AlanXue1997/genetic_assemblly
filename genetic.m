clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
% m = 10;
% population = initPopulation(graph,m);
% [decode , worktime] = getDecode(population(1,:),11);
%disp(decode);
%msd = getMSD(decode);
%disp(msd);

% a = [0 5 1 6 4 7 9 3 2 8];
% order = sortOrder(a);

decode = [1 2 3 4 5 11 6 12 7 13  8 9 10 14 15 17 16 18 19 20 21 22 23 24 25 26 27];
flag = isTopology(decode,graph);
disp(flag);