%ex1204.m 用最速下降法求最优化解
f1204 = inline('x(1)*(x(1)-5-x(2))+x(2)*(x(2)-4)','x');%目标函数
grad=inline('[2*x(1)-5-x(2),-x(1)+2*x(2)-4]','x'); %目标函数的梯度函数
x0 = [1 4];
TolX = 1e-4; 
TolFun = 1e-9;
MaxIter = 100;
dist0=1;
[xo,fo] = Opt_Steepest(f1204,grad,x0,TolX,TolFun,dist0,MaxIter)