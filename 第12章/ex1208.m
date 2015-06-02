%%%ex1208.m 拉各朗日乘子法求最优化解
x=zeros(1,2);
%用syms表示出转化后的无约束函数
syms x y lama
f=x+y+lama*(x^2+y^2-2);
%分别求函数关于x、y、lama的偏导
dx=diff(f,x);
dy=diff(f,y);
dlama=diff(f,lama);
%令偏导为零求解x、y
xx=solve(dx,x); %将x表示为lama函数
yy=solve(dy,y);  %将y表示为lama函数
ff=subs(dlama,{x,y},{xx,yy}); %代入dlama得关于lama的一元函数
lamao=solve(ff); %求解得lamao
xo=subs(xx,lama,lamao) %求得取极值处的xo
yo=subs(yy,lama,lamao)  %取极值处的yo
fo=subs(f,{x,y,lama},{xo,yo,lamao}) %极值点函数值