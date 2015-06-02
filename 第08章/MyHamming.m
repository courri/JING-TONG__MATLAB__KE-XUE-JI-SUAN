function [x,y]=MyHamming(f,x0,xt,y0,N,KC)
% 用hamming方法解向量微分方程 y’(t) = f(t,y(t))
% x向量范围[x0,xt], 初值 y0,N 离散点数
% 根据取决于KC = 1/0的误差估计决定是否使用改正公式
if nargin < 6,
    KC = 1; %缺省使用更正公式
end 
if nargin < 5 | N <= 0
    N = 100; %最大迭代数缺省为100
end 
if nargin < 4
    y0 = 0; %初值缺省为0
end 
y0 = y0(:)';  %使y0为行向量
h = (xt-x0)/(N-1); %步长
xt0 = x0+2*h;
[x,y] = MyRunge_Kutta(f,x0,xt0,y0,3); %用 Runge-Kutta 得初始三点值
x = [x(1:3)' x(4):h:xt]'; %重新调整x向量，使其前三点与Runge-Kutta法计算的三点相同
for k = 2:4
    F(k-1,:) = feval(f,x(k),y(k,:)); %计算f2 f3 f4
end
p = y(4,:);   % 预估量初值
c = y(4,:);   %校正量初值
h34 = h/3*4;  %预估公式中系数
KC11 = KC*112/121; %更正公式中系数
KC91 = KC*9/121;  %最后计算y值的公式中更正项的系数
h312 = 3*h*[-1 2 1]; %校正公式中各f项系数
for k = 4:N-1
p1 = y(k-3,:) + h34*(2*(F(1,:) + F(3,:)) - F(2,:)); %p(n+1)计算公式
m1 = p1 + KC11*(c - p); %m(n+1)计算公式
c1 = (-y(k - 2,:) + 9*y(k,:) +...
h312*[F(2:3,:); feval(f,x(k + 1),m1)])/8; %c(n+1)计算公式
y(k+1,:) = c1 - KC91*(c1 - p1); %y(n+1)计算公式
p = p1;  %更新预测值
c = c1;  %更新校正值
F = [F(2:3,:);feval(f,x(k + 1),y(k + 1,:))];
end