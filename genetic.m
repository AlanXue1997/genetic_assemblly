clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
m = 6;
population = initPopulation(graph,m);