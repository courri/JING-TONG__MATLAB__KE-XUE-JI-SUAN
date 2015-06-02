%%%ex1207.m 遗传算法计算最优解
f = inline('x(1)^4-16*x(1)^2-5*x(1)*x(2)+x(2)^4-16*x(2)^2-5*x(2)','x');
l = [-5 -5]; %下限
u = [5 5]; %上限
x0 = [0 0];
Np = 30; %群体大小
Nb = [12 12]; %代表每个变量的二进制位数
Pc = 0.5;  %交叉概率
Pm = 0.01; %变异概率
eta = 0.8;   %学习率
kmax = 200; %最大迭代次数
[xos,fos]=fminsearch(f,x0)
[xo_gen,fo_gen] = genetic(f,x0,l,u,Np,Nb,Pc,Pm,eta,kmax)