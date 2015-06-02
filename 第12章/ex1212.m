%ex1212.m用函数fmincon求约束最优化问题
clear all
f=inline('exp(x(1))*(4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1)','x');
x0=[-1 1];
[x,fval]=fmincon(f,x0,[],[],[],[],[],[],'fcon1212')
