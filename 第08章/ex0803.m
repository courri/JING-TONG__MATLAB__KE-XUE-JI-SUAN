%�����ֲ�ͬ������΢�ַ���
clear, clf
x0=0;
xt=2;
Num=100;
h=(xt-x0)/(Num-1);
x =x0+[0:Num]*h;
a = 1; 
yt = 1-exp(-a*x); %��ֵ��
fun = inline('-y + 1','x','y'); %��inline���캯��f(x,y)
y0 = 0; %�趨������ֵ
PointNum = 4; %�趨ȡ����
[x1,ye] = MyEuler(fun,x0,xt,y0,PointNum);
[x2,yh] = MyEulerPro(fun,x0,xt,y0,PointNum);
[x3,yr] = MyRunge_Kutta(fun,x0,xt,y0,PointNum);
plot(x,yt,'k', x1,ye,'b:', x2,yh,'g:', x3,yr,'r:')
legend('��ֵ','��ŷ������','�Ľ�ŷ������','Runge-Kutta����')
hold on
plot(x1,ye,'bo',x2,yh,'b+', x3,yr,'r*')
PointNum= 1000; %���Ƹ��㷨����PointNum��������ʱ��
tic  %��ʱ��ʼ
[x1,ye] = MyEuler(fun,x0,xt,y0,PointNum);
time_Euler = toc %�õ�ŷ����������ʱ��
tic
[x1,yh] = MyEulerPro(fun,x0,xt,y0,PointNum); 
time_EulerPro = toc
tic
[x1,yr] = MyRunge_Kutta(fun,x0,xt,y0,PointNum); 
time_RK4 = toc