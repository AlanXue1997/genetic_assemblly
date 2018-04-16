clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');

m = 1;
population = initPopulation(graph,m);
%disp(population);
% 
% p = decoding(population(1,:),3);
% disp(getMSD(p));
% 
% for i=1:m
%     disp(isTopology(population(i,:),graph));
% end

decode = [1     2     4     3     5     6    10     7     8    11     9    12    13    16    14    15    17    18    19    20    21    22    23    24    25];
disp(decode);
decode = before_after(decode,graph);
disp(decode);