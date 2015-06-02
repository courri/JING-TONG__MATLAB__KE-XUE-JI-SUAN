%ex1103.m 分别计算二维离散分布的均值
clear all
X=[0,1,2];
Y=[1,2,3,4];
Px=[0.1,0.7,0.2]; %X各点对应的概率
Py=[0.1,0.4,0.2,0.3]; %Y各点对应概率
mX=sum(X.*Px)  %E(X) sum为求和函数。
mY=sum(Y.*Py)
z=X+3;
mX3=sum(z.*Px) %E(X+3)
mXY=mX+mY      %E(X+Y)
