function ex0903()
A = 0.5; %方程系数
it0 = inline('sin(pi*x)','x'); %初始条件
bx0 = inline('0'); bxf = inline('0'); %边界条件
xf = 2; M = 80; T = 0.1; N = 100;
%uo = inline('sin(pi*x)*exp(-pi*pi*t)','x','t');%

[u1,x,t] = EF_Euler(A,xf,T,it0,bx0,bxf,M,N);
figure(1),clf,mesh(t,x,u1)
xlabel('x')
ylabel('y')
zlabel('U')
title('r>0.5')
M=50;
[u1,x,t] = EF_Euler(A,xf,T,it0,bx0,bxf,M,N);
figure(2),clf,,mesh(t,x,u1)
xlabel('x')
ylabel('y')
zlabel('U')
title('r<0.5')


%[u2,x,t] = heat_imp(a,xf,T,it0,bx0,bxf,M,N); %converge unconditionally
%figure(2), clf, mesh(t,x,u2)
%[u3,x,t] = heat_CN(a,xf,T,it0,bx0,bxf,M,N); %converge unconditionally
%figure(3), clf, mesh(t,x,u3)
%MN = M*N;
%Uo = uo(x,t); aUo = abs(Uo)+eps; %values of true analytical solution
%How far from the analytical solution?
%err1 = norm((u1-Uo)./aUo)/MN
%err2 = norm((u2-Uo)./aUo)/MN
%err3 = norm((u3-Uo)./aUo)/MN