function ex1003()
%函数sin(x)+x^2的拉氏变换为：1/(s^2+1)+2/s^3
%作出拉氏变化后的网格图
x1=-0.2:0.03:0.2;
y1=-0.2:0.03:0.2;
[x,y]=meshgrid(x1,y1);
s=x+i*y;
f=1./(s^2+1)+2./s^3;
mesh(x,y,f);
surf(x,y,f);
colormap(hsv);

