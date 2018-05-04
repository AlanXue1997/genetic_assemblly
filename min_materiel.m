function [summateriel] = min_materiel(p)
    materiel = zeros(3,14);
    a = 0;
    b = 0;
    c = 0;
    for i=1:14
        if p(i) == 1
            a = a+1;
        elseif p(i) == 2
            b = b+1;
        elseif p(i) == 3
            c = c+1;
        end
        materiel(1,i) = a;
        materiel(2,i) = b;
        materiel(3,i) = c;
    end
    summateriel = sum(sum(materiel));
end