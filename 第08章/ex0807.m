%ex0807.m 用自编函数MyEulerPro（）MyRunge_Kutta（）求多阶微分方程
clear,clc
x0=1; %设定函数变量起始值
xt=10; %设定函数变量终止值
y0=[1 10 30]; %y初值
N=100;
[x,yE]=MyEulerPro('myfun03',x0,xt,y0,N);
[x,yR]=MyRunge_Kutta('myfun03',x0,xt,y0,N);
plot(x,yE(:,1),'r*',x,yR(:,1),'go')
legend('改进欧拉法解','R-K法解')