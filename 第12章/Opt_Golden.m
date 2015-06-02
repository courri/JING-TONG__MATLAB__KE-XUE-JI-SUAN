function [xo,fo]=Opt_Golden(f,a,b,TolX,TolFun,k)
%%%%黄金搜索算法求在区间[a,b]上的最优化解
%f为目标函数，TolX为x阈值，TolFun为函数阈值，k为迭代次数
r =(sqrt(5)-1)/2; %r为黄金分割点值，
h = b-a;  %区间宽度
rh = r*h; 
%%%取两点c、d,并计算相应的函数值fc和fd
c = b-rh; 
d = a+rh;
fc = feval(f,c);
fd = feval(f,d);
%%%算法第二步判断是否停止迭代
if k <= 0 | (abs(h) < TolX & abs(fc - fd) < TolFun)
    if fc <= fd
        xo = c;
        fo = fc;
    else
        xo = d;
        fo = fd;
    end
    if k == 0
        fprintf('最好设定迭代次数大于0');
    end
%%%%算法第三步，进行新一轮迭代    
else
    if fc < fd
        [xo,fo] = Opt_Golden(f,a,d,TolX,TolFun,k-1);
    else
        [xo,fo] = Opt_Golden(f,c,b,TolX,TolFun,k-1);
    end
end