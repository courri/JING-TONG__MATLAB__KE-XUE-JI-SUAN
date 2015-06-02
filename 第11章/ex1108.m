%ex1108.m 求[0,2]均匀分布在某点的概率密度值
clear all
x=[0.4,0.6,1.4,1.6];
f1=pdf('unif',x,0,2) %用pdf（）计算
f2=unifpdf(x,0,2)     %用unifpdf（）计算