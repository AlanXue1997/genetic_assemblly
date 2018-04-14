function [ decode , worktime ] = getDecode( people,n )
   product_time = xlsread('.\产品工时表');
   col = size(people,2);
   decode = zeros(1,n+1+col);
   worktime = zeros(1,n);
   for i=1:size(people,2)
        decode(1,i+1) = product_time(people(1,i),1);
   end
   
   while 1
       q = find(decode(1,:)==0);
       for i=1:n
            worktime(1,i) = sum(decode(1,q(i):q(i+1)));
       end
       for i=1:n-1
           if worktime(1,i)-decode(q(i+1)-1) >= worktime(1,i+1)
                worktime(1,i) = worktime(1,i) - decode(q(i+1)-1);
                worktime(1,i+1) = worktime(1,i+1) + decode(q(i+1)-1);
                decode(q(i+1)) = decode(q(i+1)-1);
                decode(q(i+1)-1) = 0;
           end
       end
       p = find(decode(1,:)==0);
       disp(var(worktime,1));
       if(isequal(q,p)==1)
           break;
       end
   end
end