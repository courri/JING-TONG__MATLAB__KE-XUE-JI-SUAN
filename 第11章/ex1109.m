%ex1109.m 绘制正态分布的概率密度图
clear all
x=[-10:0.1:10];
f1=normpdf(x,0,1); %N(0,1)pdf
f2=normpdf(x,0,2);  %N(0,4)pdf
f3=normpdf(x,1,2);  %N(1,4)pdf
plot(x,f1,'b*',x,f2,'ro',x,f3,'g+')
legend('X~N(0,1)','X~N(0,4)','X~N(1,4)')