function [ judge ] = isTopology( decode , graph )

len = size(decode,2); %��ȡ������������еĳ���
i=1; %��Ӧ�������еĵ�i��Ԫ��
m = find( (sum(graph,2)'==0) + (sum(graph(:,:))~=0) == 2 ); %��DAG��ԭ�������ҵ���Ȳ�Ϊ�㣬����Ϊ���λ��

%�ж����������еĵ�iԪ���Ƿ������������������
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

%�ж�����������������Ȳ�Ϊ�㣬����Ϊ���λ��
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

%�����жϽ��
if sum(decode)==0
    judge = 1;
else
    judge = 0;
end
end