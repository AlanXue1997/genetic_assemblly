function [ population ] = initPopulation( graph,m )
%INITPOPULATION Summary of this function goes here
%   Detailed explanation goes here
col = size(graph,2);
population = zeros(m,col);
for i=1:m
    population(i,:) = getPeople(graph);
end

