%ex1206.m 用模拟退火法计算函数的最小值
clear all
f = inline('5*sin(x(1)*x(2))+x(1)^2+x(2)^2','x');
l = [-5 -5]; %下限
u = [5 5]; %上限
x0 = [-4 0];
TolFun = 1e-9;
TolX=1e-5;
kmax = 800;
%%%%用Nelder-Meat法求
[xo_nd,fo] = Opt_Nelder(f,x0,TolX,TolFun,kmax) 
 %%%%用matlab内置函数验证
[xos,fos] = fminsearch(f,x0)
[xou,fou] = fminunc(f,x0)
%%%%用模拟退火法求
 q =0.8;
[xo_sa,fo_sa] =Opt_Simu(f,x0,l,u,kmax,q,TolFun)