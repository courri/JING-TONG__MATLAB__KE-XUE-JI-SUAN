function [Xout,Yout]=MyEulerPro(fun,x0,xt,y0,PointNumber)
%MyEulerPro 用改进的欧拉法解微分方程
if nargin<5 | PointNumber<=0 %如果函数仅输入4个参数值，则PointNumer默认值为100
    PointNumer=100;
end
if nargin<4 %y0默认值为0
    y0=0;
end
h=(xt-x0)/PointNumber;%计算所取的两离散点之间的距离
x=x0+[0:PointNumber]'*h;%表示出离散的自变量x
y(1,:)=y0(:)';
for i=1:PointNumber    %迭代计算过程
    f1=h*feval(fun,x(i),y(i,:));
    f1=f1(:)';
    f2=h*feval(fun,x(i+1),y(i,:)+f1);
    f2=f2(:)';
    y(i+1,:)=y(i,:)+1/2*(f1+f2);
end
Xout=x;
Yout=y;