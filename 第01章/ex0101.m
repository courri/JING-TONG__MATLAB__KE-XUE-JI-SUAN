function ex0101()
x=0:pi/15:2*pi;
y1=0.5*x.^2;
y2=10*sin(x);
plot(x,y1,'r.-',x,y2);	%��ʼ��ͼ������y1ʹ�õ㻮�ߣ���ɫ��r��
grid			%��ʾ������
xlabel('variable x')	%��x���ע����variable x��
ylabel('variable y')	%��y���ע����variable y��
title('x^2 and sin(x)');%����
text(6.2,-5.5,'sin(x)');%�ڵ㣨6.2,-5.5��������עsin��x��
text(6.2,16,'x^2');	%�ڵ㣨6.2,16������עx^2
