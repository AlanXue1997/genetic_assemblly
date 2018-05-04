function [ p ] = getArrangement( x )
%GETARRANGEMENT Summary of this function goes here
%   Detailed explanation goes here

source = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3];

p = source(sortOrder(x));


end

