function [ minchangetime ] = min_changetime(p)
    changetime = xlsread('.\产品切换时间表.xlsx');
    minchangetime = 0;
    for i=2:14
        if p(i) ~= p(i-1)
            minchangetime = minchangetime+changetime(p(i-1),p(i));
        end
    end
end