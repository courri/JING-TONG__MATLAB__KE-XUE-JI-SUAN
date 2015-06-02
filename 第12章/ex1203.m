%ex1203.m 用Nelder-Mead方法求最优化解
f1203 = inline('x(1)*(x(1)-5-x(2))+x(2)*(x(2)-4)','x');
x0 = [0 4];
TolX = 1e-4; 
TolFun = 1e-9;
MaxIter = 100;
[xN,fN] = Opt_Nelder(f1203,x0,TolX,TolFun,MaxIter)
%取最小值点以及此处的最小值
[xF,fF] = fminsearch(f1203,x0) %用MATLAB内置函数fminsearch求解