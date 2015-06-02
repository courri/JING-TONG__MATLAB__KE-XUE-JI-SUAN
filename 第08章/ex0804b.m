%ex0804b.m 用ode45 得到微分方程解并计算出该算法运行时间
fun =inline('-3*y^2+2*x.^2+3*x','x','y'); %用inline构造函数f(x,y)
ode45(fun,[0,1],1) %可得到输出得函数图
tic 
[x,y]=ode45(fun,[0,1],1); 
t1=toc 
tic 
[x,y]=ode23(fun,[0,1],1); 
t2=toc 