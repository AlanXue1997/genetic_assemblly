function [ judge ] = isTopology( decode , graph )

len = size(decode,2); %获取输入的有序序列的长度
i=1; %对应有序序列的第i个元素
m = find( (sum(graph,2)'==0) + (sum(graph(:,:))~=0) == 2 ); %在DAG的原矩阵中找到入度不为零，出度为零的位置

%判断有序序列中的第i元素是否满足拓扑排序的条件
while i < len
    q = find((sum(graph(:,:))==0)+(sum(graph,2)>0)'==2);
    if find(q==decode(1,i)) > 0
        graph(decode(1,i),:) = 0;
        decode(1,i) = 0;
    else
        break;
    end
    i=i+1;
end

%判断有序序列中最后的入度不为零，出度为零的位置
p = find(decode==0);
j = size(p,2);
while j < len
    if find(m==decode(1,i)) > 0
        decode(1,i) = 0;
        i=i+1;
        j=j+1;
    else
        break;
    end
end

%给出判断结果
if sum(decode)==0
    judge = 1;
else
    judge = 0;
end
end