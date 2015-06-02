function ex0802()
%ex0802 比较改进欧拉法，简单欧拉方法以及微分方程符号解
[x3,y3]=MyEulerPro('myfun01',0,2*pi,1,128);
[x,y1]=MyEuler('myfun01',0,2*pi,1,128);%欧拉法所的的解
y=dsolve('Dy=y+sin(t)','y(0)=1');%该常微分方程的符号解
for k=1:129
t(k)=x(k);
y2(k)=subs(y,t(k));%求其对应点的离散解
end
plot(x,y1,'-b',x3,y3,'og',x,y2,'*r')
legend('简单欧拉法解','改进欧拉解','符号解')




