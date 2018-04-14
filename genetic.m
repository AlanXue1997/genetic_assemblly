clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
m = 6;
population = initPopulation(graph,m);

a = [0 5 1 6 4 7 9 3 2 8];
order = sortOrder(a);
