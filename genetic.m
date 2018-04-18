clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');

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
k = 1;   %每个k/m对应被选入新种群的概率
count = 1;  %记录换代的次数
flag=1;  %记录newpopulation中位置
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

    %新种群的数量小于m从新种群中选一个个体进行变异，加入新种群中，最终使新种群的数量与原种群相同
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
