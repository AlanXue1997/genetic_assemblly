function [ E ] = calcEntropy( x )
%CALCENTROPY Summary of this function goes here
%   Detailed explanation goes here

m = sum(x);
x = x/m;

E = sum(-x.*log2(x));

end

