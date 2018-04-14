clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
m = 10;
population = initPopulation(graph,m);
% [decode , worktime] = getDecode(population(1,:),5);
% disp(decode);
% disp(worktime);

p = decoding(population(1,:), 3);

% a = [0 5 1 6 4 7 9 3 2 8];
% order = sortOrder(a);
