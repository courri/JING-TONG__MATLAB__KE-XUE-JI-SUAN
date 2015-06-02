function [outx,outy]=MyEuler(fun,x0,xt,y0,PointNum)
%MyEuler 用前向差分的欧拉方法解微分方程
%fun 表示f（x，y）
%x0,xt表示自变量的初值和终值
%y0表示函数在x0处的值,其可以为向量形式
%PointNum表示自变量在[x0,xt]上取的点数
if nargin<5 | PointNum<=0 %如果函数仅输入4个参数值，则PointNum默认值为100
    PointNum=100;
end
if nargin<4 %y0默认值为0
    y0=0;
end
h=(xt-x0)/PointNum;%计算步长h
x=x0+[0:PointNum]'*h;%自变量数组
y(1,:) = y0(:)';%将输入存为行向量，输入为列向量形式
for k = 1:PointNum
    f=feval(fun,x(k),y(k,:));%计算f(x,y)在每个迭代点的值
    f=f(:)';
    y(k + 1,:) =y(k,:) +h*f; %对于所取的点x迭代计算y值
end
outy=y;
outx=x;
%plot(x,y)%画出方程解的函数图
