%ex1110.m 累积分布函数和逆累积分布函数编程实现
clear all
%%%%用累积分布函数计算概率值
y1=normcdf(4,1,3) %P(X<4)
y2=normcdf(5,1,3)-normcdf(1,1,3) %P(1<X<5)
y3=1-normcdf(6,1,3)   %P(X>6)
y4=normcdf(4,1,3)-normcdf(-4,1,3) %P(|X|<4)
%%%%%用逆累积分布函数计算给定概率值的x值
c=norminv(0.5,1,3)  %P(X<c)=0.5