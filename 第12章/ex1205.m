%ex1205.m ��ţ�ٷ������Ż���
f1205 = inline('x(1)*(x(1)-5-x(2))+x(2)*(x(2)-4)','x');%Ŀ�꺯��
grad=inline('[2*x(1)-5-x(2),-x(1)+2*x(2)-4]','x'); %Ŀ�꺯�����ݶȺ���
x0 = [-8;-8]; 
options=optimset('TolX',1e-4,'TolFun',1e-9,'MaxIter',100);
xo = fsolve(grad,x0,options) %��fsolve�������Է������
yo=f1205(xo)