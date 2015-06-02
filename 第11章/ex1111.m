%ex1111.m 计算二项分布的概率
clear all
a=binocdf(49,100,0.4);  %P(X<50)
p1=1-a         %P(X>=50),事件出现不小于50次概率
p2=binopdf(30,100,0.4)  %P(X=30)