function ex1001()
subplot(1,2,1),fplot('sin(x)/(pi*x)', [-3*pi,3*pi]);
title('ʱ��ͼ')
hold on;
subplot(1,2,2),fplot('-heaviside(x-1)+heaviside(x+1)',[-3,3]);
title('���ϱ任���Ƶ��ͼ');
axis([-3 3 0 1.5]);%��������
