%ex0808 用ode23 ode45 ode113解多阶微分方程
clear,clc
[x23,y23]=ode23('myfun03',[1,10],[1 10 30]);
[x45,y45]=ode45('myfun03',[1,10],[1 10 30]);
[x113,y113]=ode113('myfun03',[1,10],[1 10 30]);
figure(1) %第一幅图
plot(x23,y23(:,1),'*r',x45,y45(:,1),'ob',x113,y113(:,1),'+g') %作出各种函数所得结果
legend('ode23解','ode45解','ode113解')
title('ODE函数求解结果')
figure(2)
plot(x45,y45)  %以ode45为例作出函数以及其各阶导数图
legend('y','y一阶导数','y两阶导数')
title('y,y一阶导数,y二阶导数函数图')
