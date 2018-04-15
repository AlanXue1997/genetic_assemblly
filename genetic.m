clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
m = 10;
population = initPopulation(graph,m);

p = decoding(population(1,:), 3);
disp(getMSD(p));

for i=1:m
    disp(isTopology(population(i,:),graph));
end