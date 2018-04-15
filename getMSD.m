function [msd] = getMSD(decode)

q = find(decode(1,:)==0);
sumblock = zeros(1,size(q,2)-1);
for i=1:size(q,2)-1
    sumblock(1,i) = sum(decode(1,q(i):q(i+1)));
end
avg = mean(sumblock);
sumdecode = 0;
for i=1:size(q,2)-1
    sumdecode = sumdecode + (sumblock(1,i)-avg)^2;
end
msd = sqrt(sumdecode)/size(sumblock,2);