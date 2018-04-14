function [ people ] = getPeople( graph )
n=1;  %��ʾ�ҵ������Ϊ�㣬���Ȳ�Ϊ����˵ĸ���
%a=0;  %��ʾ��һ���ҵ����˵Ķ�Ӧ�����λ��
col = size(graph,2);
people = zeros(1,col);
visited = [1:col];
while sum(sum(graph)) ~= 0
    q = find((sum(graph(:,:))==0)+(sum(graph,2)>0)'==2);
    lenq = size(q,2);
    a = q(1,1);
    if lenq>1
        for i=2:lenq 
            if rem(int8(lenq*rand()),n)==0
                a = q(1,i);
            end
        end
    end
    graph(a,:) = 0;
    people(1,n) = a;
    visited(1,a) = 0;
    n=n+1;
end

while sum(visited) ~= 0
    p = find(visited(1,:)>0);
    lenp = size(p,2);
    a = p(1,1);
    if lenp>1
        for i=2:lenp
            if rem(int8(lenp*rand()),n)==0
                a = p(1,i);
            end
        end
    end
    graph(a,:) = 0;
    people(1,n) = a;
    visited(1,a) = 0;
    n=n+1;
end

end