function [xo,fo] =Opt_Nelder(f,x0,TolX,TolFun,MaxIter)
%Nelder-Mead法用于多维变量的最优化问题，维数>=2.
N = length(x0);
if N == 1 %一维情况，用二次逼近计算
    [xo,fo] = Opt_Quadratic(f,x0,TolX,TolFun,MaxIter);
    return
end
S = eye(N);
for i = 1:N  %自变量维数大于2时，重复计算每个子平面的情况
    i1 = i + 1;
    if i1 > N
        i1 = 1;
    end
    abc = [x0; x0 + S(i,:); x0 + S(i1,:)]; %每一个定向子平面
    fabc = [feval(f,abc(1,:)); feval(f,abc(2,:)); feval(f,abc(3,:))];
    [x0,fo] = Nelder0(f,abc,fabc,TolX,TolFun,MaxIter);
    if N < 3  %二维情况不需重复
        break;
    end 
end
xo = x0;