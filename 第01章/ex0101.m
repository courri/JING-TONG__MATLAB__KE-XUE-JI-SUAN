function ex0101()
x=0:pi/15:2*pi;
y1=0.5*x.^2;
y2=10*sin(x);
plot(x,y1,'r.-',x,y2);	%开始作图，其中y1使用点划线，红色（r）
grid			%显示网格线
xlabel('variable x')	%在x轴标注：“variable x”
ylabel('variable y')	%在y轴标注：“variable y”
title('x^2 and sin(x)');%标题
text(6.2,-5.5,'sin(x)');%在点（6.2,-5.5）处，标注sin（x）
text(6.2,16,'x^2');	%在点（6.2,16）处标注x^2
