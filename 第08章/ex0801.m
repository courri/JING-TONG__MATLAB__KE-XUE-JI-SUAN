function ex0801()
[x1,y1]=MyEuler('myfun01',0,2*pi,1,16);%欧拉法所的的解
h1=2*pi/15 %计算取16点的步长
[x11,y11]=MyEuler('myfun01',0,2*pi,1,32);%欧拉法所的的解
h2=pi/15 %计算取32点的步长
y=dsolve('Dy=y+sin(t)','y(0)=1');%该常微分方程的解析解
for k=1:33
t(k)=x11(k);
y2(k)=subs(y,t(k));%求其对应点的离散解
end
plot(x1,y1,'+b',x11,y11,'og',x11,y2,'*r')
legend('h=0.4的欧拉法解','h=0.2的欧拉解','符号解')
