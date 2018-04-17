function [ change ] = changedecode( population , graph )
len = size(population,2);
j=1;
while 1
    a = floor(len*rand())+1;
    b = floor(len*rand())+1;
    if a>b
        temp = b;
        b = a;
        a = temp;
    end
    temp = population(2,a:b);
    population(2,a:b) = population(1,a:b);
    population(1,a:b) = temp;
    if (isTopology(population(1,:), graph) == 1) && (isTopology(population(2,:), graph) == 1)
        break;
    end
%     temp = population(2,a:b);
%     population(2,a:b) = population(1,a:b);
%     population(1,a:b) = temp;
    disp(j);
    j=j+1;
end
change = population;
end