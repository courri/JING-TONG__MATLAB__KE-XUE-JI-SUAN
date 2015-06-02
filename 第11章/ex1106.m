%ex1106.m 计算向量之间的协方差和相关系数
clear all
x=[1,2,2,2,1,2]; 
y=[2,3,2,2,3,2];
cx=cov(x)   %计算向量x的协方差，可知其等于x方差
vx=var(x)   %x方差
cxy=cov(x,y) %x、y协方差
cor=corrcoef(x,y)  %x、y相关系数
