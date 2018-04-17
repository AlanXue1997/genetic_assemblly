clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');

%m = 2;
%population = initPopulation(graph,m);
%disp(population);
% 
% p = decoding(population(1,:),3);
% disp(getMSD(p));
% 
% for i=1:m
%     disp(isTopology(population(i,:),graph));
% end
population(1,:) = [1 2 6 7 8 9 10 11 17 18 19 20 12 13 14 3 4 5 15 16 21 22 23 24 25];
population(2,:) = [1 2 6 7 8 9 10 20 12 13 11 17 16 21 22 18 19 14 3 4 5 15 23 24 25];

%decode = before_after(population,graph);
decode = changedecode(population,graph);
disp(population(1,:));
disp(population(2,:));
% disp(decode(1,:));
% disp(decode(2,:));
