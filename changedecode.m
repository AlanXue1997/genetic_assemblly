function [ change ] = changedecode( population , graph )
len = size(population,2);
j=1;
while 1
    a=0;
    while a == 0
        a = rand();
        a = int8(a*len);
    end
    b=0;
    while b == 0
        b = rand();
        b = int8(b*len);
    end
    if a>b
        temp = b;
        b = a;
        a = temp;
    end
    temp = population(2,a:b);
    population(2,a:b) = population(1,a:b);
    population(1,a:b) = temp;
    for i=1:2
        if isTopology(population(i,:), graph) == 1
            break;
        else
            temp = population(2,a:b);
            population(2,a:b) = population(1,a:b);
            population(1,a:b) = temp;
        end
    end
    disp(j);
    j=j+1;
end
change = decode;
end