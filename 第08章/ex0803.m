%用三种不同方法解微分方程
clear, clf
x0=0;
xt=2;
Num=100;
h=(xt-x0)/(Num-1);
x =x0+[0:Num]*h;
a = 1; 
yt = 1-exp(-a*x); %真值解
fun = inline('-y + 1','x','y'); %用inline构造函数f(x,y)
y0 = 0; %设定函数初值
PointNum = 4; %设定取点数
[x1,ye] = MyEuler(fun,x0,xt,y0,PointNum);
[x2,yh] = MyEulerPro(fun,x0,xt,y0,PointNum);
[x3,yr] = MyRunge_Kutta(fun,x0,xt,y0,PointNum);
plot(x,yt,'k', x1,ye,'b:', x2,yh,'g:', x3,yr,'r:')
legend('真值','简单欧拉法解','改进欧拉法解','Runge-Kutta法解')
hold on
plot(x1,ye,'bo',x2,yh,'b+', x3,yr,'r*')
PointNum= 1000; %估计各算法运行PointNum步迭代的时间
tic  %计时开始
[x1,ye] = MyEuler(fun,x0,xt,y0,PointNum);
time_Euler = toc %得到欧拉法的运行时间
tic
[x1,yh] = MyEulerPro(fun,x0,xt,y0,PointNum); 
time_EulerPro = toc
tic
[x1,yr] = MyRunge_Kutta(fun,x0,xt,y0,PointNum); 
time_RK4 = toc