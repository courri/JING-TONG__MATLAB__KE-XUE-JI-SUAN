%ex1206.m ��ģ���˻𷨼��㺯������Сֵ
clear all
f = inline('5*sin(x(1)*x(2))+x(1)^2+x(2)^2','x');
l = [-5 -5]; %����
u = [5 5]; %����
x0 = [-4 0];
TolFun = 1e-9;
TolX=1e-5;
kmax = 800;
%%%%��Nelder-Meat����
[xo_nd,fo] = Opt_Nelder(f,x0,TolX,TolFun,kmax) 
 %%%%��matlab���ú�����֤
[xos,fos] = fminsearch(f,x0)
[xou,fou] = fminunc(f,x0)
%%%%��ģ���˻���
 q =0.8;
[xo_sa,fo_sa] =Opt_Simu(f,x0,l,u,kmax,q,TolFun)