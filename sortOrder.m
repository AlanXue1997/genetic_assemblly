function [ a ] = sortOrder( array, N )

len=length(array);

if nargin < 2
    N = len;
end

order = 1:len;
for i=len:-1:2
    k=i;
    while k>1 && array(floor(k/2))<array(k)
        t = array(k); array(k) = array(floor(k/2)); array(floor(k/2)) = t;
        t = order(k); order(k) = order(floor(k/2)); order(floor(k/2)) = t;
        k = floor(k/2);
    end
end

for i=1:N
    t = array(len-i+1); array(len-i+1)=array(1); array(1)=t;
    t = order(len-i+1); order(len-i+1)=order(1); order(1)=t;
    k=1;
    while true
        if k*2+1<=len-i
            if array(k*2)<array(k*2+1)
                if array(k)<array(k*2+1)
                    t = array(k); array(k) = array(k*2+1); array(k*2+1) = t;
                    t = order(k); order(k) = order(k*2+1); order(k*2+1) = t;
                    k = k*2+1;
                else
                    break;
                end
            else
                if array(k)<array(k*2)
                    t = array(k); array(k) = array(k*2); array(k*2) = t;
                    t = order(k); order(k) = order(k*2); order(k*2) = t;
                    k = k*2;
                else
                    break;
                end
            end
        elseif k*2<=len-i
            if array(k)<array(k*2)
                t = array(k); array(k) = array(k*2); array(k*2) = t;
                t = order(k); order(k) = order(k*2); order(k*2) = t;
                k = k*2;
            else
                break;
            end
        else
            break;
        end
    end
end

a=order(len:-1:len-N+1);

end

