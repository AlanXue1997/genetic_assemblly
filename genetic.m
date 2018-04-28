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
maxworktime = zeros(1,iteration_count);
while count <= iteration_count
    while k <= m
        if floor(rand()*m)<k
            newpopulation(flag,:) = population(sortposition(1,k),:);
            flag = flag+1;
        end
        k = k+1;
    end

    %����Ⱥ������С��m������Ⱥ��ѡһ��������б��죬��������Ⱥ�У�����ʹ����Ⱥ��������ԭ��Ⱥ��ͬ
    a = 1;     %����ʼ�մ��ʼ�õ��ļ��ַ��䷽ʽ�����һ��������
    while flag<=m
       j = floor(rand()*(flag-a))+1;
       newpopulation(flag,:) = before_after(newpopulation(j,:),graph);
       flag=flag+1;
       a=a+1;
    end
    
    population = newpopulation;
    max_worktime = 0;
    for i=1:m
        p = decoding(newpopulation(i,:),dividesize);
        if  Max_time(p)>max_worktime  
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
figure(2);
plot(maxmsd);
figure(3);
plot(summsd);
figure(4);
plot(maxworktime);

min_p = decoding(newpopulation(sortposition(m),:),dividesize);
person = newpopulation(sortposition(m),:);

disp(min_p);
disp(person);
[cost,CMatrix,worker_task] = minworkerprice(min_p,person);
disp(CMatrix);
disp(worker_task);
disp(cost);
