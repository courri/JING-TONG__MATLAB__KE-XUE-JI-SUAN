%ex1213.m ��fmincon������Լ�������Ż�
clear all
f=inline('-x(1)*x(2)*x(3)','x');
A=[-1,-2,-2;1,2,2]; %A*x<=b
b=[0;72];
x0=[10;10;10];
[x,fval]=fmincon(f,x0,A,b)
