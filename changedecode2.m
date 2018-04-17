function [ change ] = changedecode2( population , graph )
len = size(population,2);
k = 1;
while 1
    i = floor(len*rand())+1;
    temp = population(2,i+1:len);
    population(2,i+1:len) = population(1,i+1:len);
    population(1,i+1:len) = temp;
    for j=1:2
        if isTopology(population(j,:), graph) == 1
            break;
        end
    end
    temp = population(2,j+1:len);
    population(2,j+1:len) = population(1,j+1:len);
    population(1,j+1:len) = temp;
    
    disp(k);
    k=k+1;
end
change = population;
end