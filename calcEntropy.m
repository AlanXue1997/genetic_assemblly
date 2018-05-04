function [ E ] = calcEntropy( x, N )
%CALCENTROPY Summary of this function goes here
%   Detailed explanation goes here

len=length(x);
if nargin < 2
    N = len;
end

x = x(1:N);

m = sum(x);
x = x/m;

E = log2(len)-sum(-x.*log2(x));

end

