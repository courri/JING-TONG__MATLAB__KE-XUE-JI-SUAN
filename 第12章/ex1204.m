%ex1204.m �������½��������Ż���
f1204 = inline('x(1)*(x(1)-5-x(2))+x(2)*(x(2)-4)','x');%Ŀ�꺯��
grad=inline('[2*x(1)-5-x(2),-x(1)+2*x(2)-4]','x'); %Ŀ�꺯�����ݶȺ���
x0 = [1 4];
TolX = 1e-4; 
TolFun = 1e-9;
MaxIter = 100;
dist0=1;
[xo,fo] = Opt_Steepest(f1204,grad,x0,TolX,TolFun,dist0,MaxIter)