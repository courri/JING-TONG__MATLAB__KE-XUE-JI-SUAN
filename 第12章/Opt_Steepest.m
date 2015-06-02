function [xo,fo] = Opt_Steepest(f,grad,x0,TolX,TolFun,dist0,MaxIter)
% 用最速下降法求最优化解
%输入：f为函数名 grad为梯度函数
%x0为解的初值 TolX,TolFun分别为变量和函数的误差阈值
%dist0为初始步长 MaxIter为最大迭代次数
%输出: xo为取最小值的点 fo为最小的函数值
% f0 = f(x(0))

%%%%%%判断输入的变量数，设定一些变量为默认值
if nargin < 7
    MaxIter = 100; %最大迭代次数默认为100
end
if nargin < 6
    dist0 = 10; %初始步长默认为10
end
if nargin < 5
    TolFun = 1e-8; %函数值误差为1e-8
end
if nargin < 4
    TolX = 1e-6; %自变量距离误差
end
%%%%%第一步，求解的初值的函数值
x = x0;
fx0 = feval(f,x0);
fx = fx0;
dist = dist0;
kmax1 = 25; %线性搜索法确定步长的最大搜索次数
warning = 0; 
%%%%%迭代计算求最优解

for k = 1: MaxIter
    g = feval(grad,x);
    g = g/norm(g); %求在x处的梯度方向
    %%线性搜索方法确定步长
    dist = dist*2; %令步长为原步长的二倍
    fx1 = feval(f,x-dist*2*g);
    for k1 = 1:kmax1
        fx2 = fx1;
        fx1 = feval(f,x-dist*g);
        if fx0 > fx1+TolFun & fx1 < fx2 - TolFun %fx0 > fx1 < fx2，
            den = 4*fx1 - 2*fx0 - 2*fx2;num = den - fx0 + fx2;  %二次逼近法
            dist = dist*num/den;
            x = x - dist*g; fx = feval(f,x); %确定下一点
            break;
        else
            dist = dist/2;
        end
    end
    if k1 >= kmax1
        warning = warning + 1; %无法确定最优步长
    else
        warning = 0;
    end
    if warning >= 2|(norm(x - x0) < TolX&abs(fx - fx0) < TolFun)
        break;
    end
    x0 = x;
    fx0 = fx;
end
xo = x; fo = fx;
if k == MaxIter
    fprintf('Just best in %d iterations',MaxIter);
end