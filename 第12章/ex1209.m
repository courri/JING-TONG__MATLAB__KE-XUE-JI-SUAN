%ex1209.m 惩罚函数法求约束最优化问题
clear
f ='f1209';
x0=[3 0];
TolX = 1e-4; 
TolFun = 1e-9;
MaxIter=100;
alpha0 = 1;
%%%%选用不是基于梯度的无约束最优化方法求解，的正确结果
[xo_Nelder,fo_Nelder] = Opt_Nelder(f,x0,TolX,TolFun,MaxIter) %Nelder 方法
[fc_Nelder,fo_Nelder,co_Nelder] = f1209(xo_Nelder) %Nelder方法结果
[xo_s,fo_s] = fminsearch(f,x0) %MATLAB 内置函数fminsearch()
[fc_s,fo_s,co_s] = f1209(xo_s) %相应的结果
%%%基于梯度的方法最速下降法等，得到错误结果
grad=inline('[2*(x(1)+1)*((x(1)-1.2)^2+0.4*(x(2)-0.5)^2)+((x(1)+1)^2+4*(x(2)-1.5)^2)*2*(x(1)-1.2),8*(x(2)-1.5)*((x(1)-1.2)^2+0.4*(x(2)-0.5)^2)+((x(1)+1)^2+4*(x(2)-1.5)^2)*0.8*(x(2)-0.5)]','x');
xo_steep = Opt_Steepest(f,grad,x0,TolX,TolFun,alpha0) %最速下降法
[fc_steep,fo_steep,co_steep] = f1209(xo_steep) %相应结果
[xo_u,fo_u] = fminunc(f,x0); % MATLAB 内置函数fminunc()
[fc_u,fo_u,co_u] = f1209(xo_u) %相应结果