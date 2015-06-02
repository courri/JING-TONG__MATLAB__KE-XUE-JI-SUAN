%ex1201.m 用Opt_Golden()求解最优化
f1201 = inline('x-(x.*x-2).^3/2','x');
a = 0;
b = 4; 
TolX = 1e-4;%判断循环是否停止的x阈值
TolFun = 1e-4; %函数阈值
MaxIter = 100; %设定迭代次数
[xo,fo] = Opt_Golden(f1201,a,b,TolX,TolFun,MaxIter)