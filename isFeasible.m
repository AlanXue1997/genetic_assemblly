function [ feasible ] = isFeasible( time, period, n )
%ISFEASIBLE Summary of this function goes here
%   Detailed explanation goes here

k = 0;
s = 0;
for i=1:length(time)
    s = s + time(i);
    if s >= period
        s = 0;
        k = k + 1;
    end
end

feasible = k >= n;

end

