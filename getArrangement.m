function [ p ] = getArrangement( x, V)
%GETARRANGEMENT Summary of this function goes here
%   Detailed explanation goes here

source = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3];
for i=1:size(x,1)
    p(i,:) = source(sortOrder(x(i,:), V));
end

end

