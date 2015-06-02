%ex0804a.m 用ode23 得到微分方程解并计算出该算法运行时间
fun =inline('-3*y^2+2*x.^2+3*x','x','y'); %用inline构造函数f(x,y)
tic %计时开始
[x,y]=ode23(fun,[0,1],1); %可得到x,y输出向量值
t=toc %得到ode23的运行时间
ode23(fun,[0,1],1) %可得到输出得函数图