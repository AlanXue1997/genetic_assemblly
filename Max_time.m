function [ max_time ] = Max_time(person)
q = find(person==0);
lenq = size(q,2);
i = 1;
max_time = 0;
while i<lenq
    left = q(i)+1;
    right = q(i+1)-1;
    if person(1,left:right)*ones(right-left+1,1)>max_time
        max_time = person(1,left:right)*ones(right-left+1,1);
    end 
    i=i+1;
end
end