function ex0102()
x=0.1:pi/15:2*pi
y1=exp(x);
y2=log(x);
y3=sin(x);
y4=cos(x);

subplot(2,2,1);%��ֳ�2*2�������ڵ�һ��������ͼ
plot(x,y1);
title('exp(x)');
subplot(2,2,2);%�ڵ�2��������ͼ
plot(x,y2);
title('ln(x)');
subplot(2,2,3);%�ڵ�3��������ͼ
plot(x,y3);
title('sin(x)');
subplot(2,2,4);%�ڵ�4��������ͼ
plot(x,y4);
title('cos(x)');
[a,b,butkey]=ginput;%��ʾʮ�ֹ�꣬����λ�������
a
b

% ���н���֮�󣬿��Գ���:
% �޸�plot(x,y1);Ϊspy;
% �Լ��޸�plot(x,y4);Ϊearthmap;
% ����Ч�����Ժ���ѧϰ��һ����ȷ�Ĵ���֮��
% ����Ҫ��ȡ�Լ������п��޸Ĵ��룬
% ����ѧϰһ�ų���������Բ������Ч��ֵ�Ŷ




