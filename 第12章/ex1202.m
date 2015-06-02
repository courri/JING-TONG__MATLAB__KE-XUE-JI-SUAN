%ex1202.m用插值法求解最优化问题例10-2 
clear all
f1202=inline('(x.*x - 2).^2/2-1', 'x');;
%%%设定区间端点
a = 0;
b = 5;
%%%分别设定x阈值和函数f阈值
TolX = 1e-5; 
TolFun = 1e-8; 
%%%设定迭代次数
MaxIter = 100;
%%%用二次插值函数求解
[xoq,foq] = Opt_Quadratic(f1202,[a b],TolX,TolFun,MaxIter)
%用matlab内置函数求最小值以及它的函数值
[xob,fob] = fminbnd(f1202,a,b) %MATLAB 内置函数求解