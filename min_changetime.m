function [ minchangetime ] = min_changetime(p)
    changetime = [0 13 12;15 0 16; 16 14 0];
    minchangetime = 0;
    for i=2:14
        if p(i) ~= p(i-1)
            minchangetime = minchangetime+changetime(p(i-1),p(i));
        end
    end
end