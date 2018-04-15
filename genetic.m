clear,clc;

graph = getDAG('.\��ҵ���ȹ�ϵ����.xlsx');
m = 10;
population = initPopulation(graph,m);

p = decoding(population(1,:), 5);
disp(getMSD(p));
disp(p');

for i=1:m
    disp(isTopology(population(i,:),graph));
end

