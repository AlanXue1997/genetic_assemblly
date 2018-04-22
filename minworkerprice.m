function [cost,CMatrix,worker_task] = minworkerprice(decode)
workerprice = xlsread('.\工人任务成本.xlsx');
q = find(decode==0);
i = 1;
n = 1;
m = 1;
newworkerprice = zeros(size(workerprice,2),size(workerprice,2));
while i+1<=size(q,2)
    n = m;
    k = q(i+1)-q(i);
    m = m+k-1;
    p = m-1;
    newworkerprice(i,:) = sum(workerprice(n:p,:));
    i = i+1;
end

[cost,CMatrix] = Assignment(newworkerprice,1);
worker_task = zeros(2,11);
worker_task(1,:) = [1:11];
t = 1;
while t<=size(workerprice,2)
   q = find(CMatrix(t,:)==1);
   worker_task(2,t) = q(1);
   t=t+1; 
end

end