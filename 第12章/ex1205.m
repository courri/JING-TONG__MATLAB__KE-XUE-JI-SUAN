%ex1205.m 用牛顿法求最优化解
f1205 = inline('x(1)*(x(1)-5-x(2))+x(2)*(x(2)-4)','x');%目标函数
grad=inline('[2*x(1)-5-x(2),-x(1)+2*x(2)-4]','x'); %目标函数的梯度函数
x0 = [-8;-8]; 
options=optimset('TolX',1e-4,'TolFun',1e-9,'MaxIter',100);
xo = fsolve(grad,x0,options) %用fsolve求解非线性方程零点
yo=f1205(xo)