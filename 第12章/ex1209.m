%ex1209.m �ͷ���������Լ�����Ż�����
clear
f ='f1209';
x0=[3 0];
TolX = 1e-4; 
TolFun = 1e-9;
MaxIter=100;
alpha0 = 1;
%%%%ѡ�ò��ǻ����ݶȵ���Լ�����Ż�������⣬����ȷ���
[xo_Nelder,fo_Nelder] = Opt_Nelder(f,x0,TolX,TolFun,MaxIter) %Nelder ����
[fc_Nelder,fo_Nelder,co_Nelder] = f1209(xo_Nelder) %Nelder�������
[xo_s,fo_s] = fminsearch(f,x0) %MATLAB ���ú���fminsearch()
[fc_s,fo_s,co_s] = f1209(xo_s) %��Ӧ�Ľ��
%%%�����ݶȵķ��������½����ȣ��õ�������
grad=inline('[2*(x(1)+1)*((x(1)-1.2)^2+0.4*(x(2)-0.5)^2)+((x(1)+1)^2+4*(x(2)-1.5)^2)*2*(x(1)-1.2),8*(x(2)-1.5)*((x(1)-1.2)^2+0.4*(x(2)-0.5)^2)+((x(1)+1)^2+4*(x(2)-1.5)^2)*0.8*(x(2)-0.5)]','x');
xo_steep = Opt_Steepest(f,grad,x0,TolX,TolFun,alpha0) %�����½���
[fc_steep,fo_steep,co_steep] = f1209(xo_steep) %��Ӧ���
[xo_u,fo_u] = fminunc(f,x0); % MATLAB ���ú���fminunc()
[fc_u,fo_u,co_u] = f1209(xo_u) %��Ӧ���