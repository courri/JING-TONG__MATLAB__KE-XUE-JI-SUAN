%ex0807.m ���Աຯ��MyEulerPro����MyRunge_Kutta��������΢�ַ���
clear,clc
x0=1; %�趨����������ʼֵ
xt=10; %�趨����������ֵֹ
y0=[1 10 30]; %y��ֵ
N=100;
[x,yE]=MyEulerPro('myfun03',x0,xt,y0,N);
[x,yR]=MyRunge_Kutta('myfun03',x0,xt,y0,N);
plot(x,yE(:,1),'r*',x,yR(:,1),'go')
legend('�Ľ�ŷ������','R-K����')