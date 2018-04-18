clear,clc;

graph = getDAG('.\��ҵ���ȹ�ϵ����.xlsx');

m = 100;
dividesize = 11;
population = initPopulation(graph,m);
msd = zeros(1,m);
for i=1:m
    p = decoding(population(i,:),dividesize);
    msd(1,i) = getMSD(p);
end
sortposition = sortOrder(msd);

iteration_count = 20;
k = 1;   %ÿ��k/m��Ӧ��ѡ������Ⱥ�ĸ���
count = 1;  %��¼�����Ĵ���
flag=1;  %��¼newpopulation��λ��
newpopulation = zeros(m,size(population,2));

minmsd = zeros(1,iteration_count);
maxmsd = zeros(1,iteration_count);
summsd = zeros(1,iteration_count);
while count <= iteration_count
    while k <= m
        if floor(rand()*m)<k
            newpopulation(flag,:) = population(sortposition(1,k),:);
            flag = flag+1;
        end
        k = k+1;
    end

    %����Ⱥ������С��m������Ⱥ��ѡһ��������б��죬��������Ⱥ�У�����ʹ����Ⱥ��������ԭ��Ⱥ��ͬ
    while flag<=m
       j = floor(rand()*(flag-1))+1;
       newpopulation(flag,:) = before_after(newpopulation(j,:),graph);
       flag=flag+1;
    end
    
    population = newpopulation;
    for i=1:m
        p = decoding(newpopulation(i,:),dividesize);
        msd(1,i) = getMSD(p);
    end
    sortposition = sortOrder(msd);
    minmsd(1,count) = min(msd);
    maxmsd(1,count) = max(msd);
    summsd(1,count) = sum(msd);
    disp(count);
    count=count+1;
    k = 1;
    flag = 1;
end

figure(1);
plot(minmsd);
figure(2);
plot(maxmsd);
figure(3);
plot(summsd);
