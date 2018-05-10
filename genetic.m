clear,clc;

graph = getDAG('.\作业优先关系矩阵.xlsx');
time_table = xlsread('.\产品工时表')';

m = 1000;
dividesize = 11;
population = initPopulation(graph,m);
msd = zeros(1,m);
for i=1:m
    p = decoding(population(i,:),dividesize,time_table);
    msd(1,i) = getMSD(p);
end

sortposition = sortOrder(msd);

iteration_count = 200;
k = 1;   %每个k/m对应被选入新种群的概率
count = 1;  %记录换代的次数
flag=1;  %记录newpopulation中位置
newpopulation = zeros(m,size(population,2));

minmsd = zeros(1,iteration_count);
maxmsd = zeros(1,iteration_count);
summsd = zeros(1,iteration_count);
maxworktime = zeros(1,iteration_count);
while count <= iteration_count
    while k <= m
        if floor(rand()*m)<k
            newpopulation(flag,:) = population(sortposition(1,k),:);
            flag = flag+1;
        end
        k = k+1;
    end

    %新种群的数量小于m从新种群中选一个个体进行变异，加入新种群中，最终使新种群的数量与原种群相同
    a = 1;     %后面始终从最开始得到的几种分配方式中随机一种来变异
    while flag<=m
       j = floor(rand()*(flag-a))+1;
       newpopulation(flag,:) = before_after(newpopulation(j,:),graph);
       flag=flag+1;
       a=a+1;
    end
    
    population = newpopulation;
    max_worktime = inf;
    for i=1:m
        p = decoding(newpopulation(i,:),dividesize,time_table);
        if  Max_time(p)<max_worktime  
            max_worktime = Max_time(p);
        end
        msd(1,i) = getMSD(p);
    end
    sortposition = sortOrder(msd);
    minmsd(1,count) = min(msd);
    maxmsd(1,count) = max(msd);
    summsd(1,count) = sum(msd);
    maxworktime(1,count) = max_worktime;
    disp(count);
    count=count+1;
    k = 1;
    flag = 1;
end

minmsd = minmsd - min(minmsd);

figure(1);
plot(minmsd);
title('每次迭代最小均方差的变化');
xlabel('迭代次数');
ylabel('最小均方差')

% figure(2);
% plot(maxmsd);
figure(2);
plot(summsd);
title('每次迭代均方差之和的变化');
xlabel('迭代次数')
ylabel('均方差之和')

figure(3);
plot(maxworktime);
title('每次迭代工作站最大工作时间');
xlabel('迭代次数')
ylabel('工作站最大工作时间')

min_p = decoding(newpopulation(sortposition(m),:),dividesize,time_table);
min_pop = min_p;
for i=1:size(min_p,2)
    if min_p(i) ~= 0
        q = find(time_table==min_p(i));
        if size(q,2)>0
            time_table(q(1)) = -1;
            min_pop(i) = q(1);
        end
    end
end
person = newpopulation(sortposition(m),:);

disp('工作站分配方式：');
disp(min_pop);
disp('工序序列：');
disp(person);
[cost,CMatrix,worker_task] = minworkerprice(min_pop,person);
disp('工作站与工人分配：');
disp(worker_task);
disp('最小工人成本：');
disp(cost);
disp('所有迭代中工作站最大工作时间的最小时间：');
disp(maxworktime(1,iteration_count));
