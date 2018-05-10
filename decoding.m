function [ decoded_population ] = decoding( person,n,time_table )
%DECODE Summary of this function goes here
%   Detailed explanation goes here
    
time = time_table(person);

a=0;
b=sum(time);
while b-a>0.01
    mid = (a+b)/2;
    if isFeasible(time, mid, n)
        a = mid;
    else
        b = mid;
    end
end

decoded_population = zeros(1,length(time)+n+1);
s = 0;
k = 2;
for i=1:length(time)
    s = s + time(i);
    decoded_population(k) = time(i);
    k = k + 1;
    if s>=a && n>1
        s = 0;
        k = k + 1;
        n = n - 1;
    end
end

end

