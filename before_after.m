function [ change ] = before_after( decode , graph )
len = size(decode,2);
position = floor(rand()*len)+1;
right = position;
left = position;
%寻找position的前继节点
left = left-1;
while left>0
    if graph(decode(1,left),decode(1,position))==1
        break;
    end
    left = left-1;
end
right = right+1;
while right<len+1
    if graph(decode(1,position),decode(1,right))==1
        break;
    end
    right = right+1;
end

position2 = floor(rand()*(right-left-1))+left+1;
if position == position2
    
elseif position > position2
    temp = decode(1,position);
    decode(1,position2+1:position) = decode(1,position2:position-1);
    decode(1,position2) = temp;
elseif position2 > position
    temp = decode(1,position);
    decode(1,position:position2-1) = decode(1,position+1:position2);
    decode(1,position2) = temp;
end

change = decode;
end