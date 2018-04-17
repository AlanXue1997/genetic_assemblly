function [ change ] = changedecode2( population , graph )
len = size(population,2);
k = 1;
while 1
    i = floor(len*rand())+1;
    temp = population(2,i+1:len);
    population(2,i+1:len) = population(1,i+1:len);
    population(1,i+1:len) = temp;
    if (isTopology(population(1,:), graph) == 1) && (isTopology(population(2,:), graph) == 1)
        break;
    end
%     temp = population(2,i+1:len);
%     population(2,i+1:len) = population(1,i+1:len);
%     population(1,i+1:len) = temp;
    
    disp(k);
    k=k+1;
end
change = population;
end