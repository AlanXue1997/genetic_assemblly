clear,clc;

graph = getDAG('.\��ҵ���ȹ�ϵ����.xlsx');
time_table = xlsread('.\��Ʒ��ʱ��')';

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
title('ÿ�ε�����С������ı仯');
xlabel('��������');
ylabel('��С������')

% figure(2);
% plot(maxmsd);
figure(2);
plot(summsd);
title('ÿ�ε���������֮�͵ı仯');
xlabel('��������')
ylabel('������֮��')

figure(3);
plot(maxworktime);
title('ÿ�ε�������վ�����ʱ��');
xlabel('��������')
ylabel('����վ�����ʱ��')

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

disp('����վ���䷽ʽ��');
disp(min_pop);
disp('�������У�');
disp(person);
[cost,CMatrix,worker_task] = minworkerprice(min_pop,person);
disp('����վ�빤�˷��䣺');
disp(worker_task);
disp('��С���˳ɱ���');
disp(cost);
disp('���е����й���վ�����ʱ�����Сʱ�䣺');
disp(maxworktime(1,iteration_count));
