function ex1003()
%����sin(x)+x^2�����ϱ任Ϊ��1/(s^2+1)+2/s^3
%�������ϱ仯�������ͼ
x1=-0.2:0.03:0.2;
y1=-0.2:0.03:0.2;
[x,y]=meshgrid(x1,y1);
s=x+i*y;
f=1./(s^2+1)+2./s^3;
mesh(x,y,f);
surf(x,y,f);
colormap(hsv);

