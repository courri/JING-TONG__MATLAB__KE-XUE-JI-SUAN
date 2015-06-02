% ex0805 
clear,clc
[x,y]=ode45('myfun02',[0 15],[25 2]);   
plot(x,y(:,1),'-',x,y(:,2),'*') %画出y（1），y(2)的函数图
legend('y1函数图','y2函数图')