%ex1104.m 计算x的方差和标准差
clear all
x=[-1 -1 1 2]; %输入向量x
w=[1 2 3 4];  %权向量w
%用各种命令形式计算方差
v1=var(x)      
v2=var(x,0)
v3=var(x,1)
v4=var(x,w)
v5=var(x,1,1)
%用各种命令形式计算向量标准差
s1=std(x)
s2=std(x,1)
s3=std(x,w)