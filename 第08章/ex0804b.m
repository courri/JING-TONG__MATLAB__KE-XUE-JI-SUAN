%ex0804b.m ��ode45 �õ�΢�ַ��̽Ⲣ��������㷨����ʱ��
fun =inline('-3*y^2+2*x.^2+3*x','x','y'); %��inline���캯��f(x,y)
ode45(fun,[0,1],1) %�ɵõ�����ú���ͼ
tic 
[x,y]=ode45(fun,[0,1],1); 
t1=toc 
tic 
[x,y]=ode23(fun,[0,1],1); 
t2=toc 