%ex1201.m ��Opt_Golden()������Ż�
f1201 = inline('x-(x.*x-2).^3/2','x');
a = 0;
b = 4; 
TolX = 1e-4;%�ж�ѭ���Ƿ�ֹͣ��x��ֵ
TolFun = 1e-4; %������ֵ
MaxIter = 100; %�趨��������
[xo,fo] = Opt_Golden(f1201,a,b,TolX,TolFun,MaxIter)