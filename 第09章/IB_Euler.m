function [u,x,t] = IB_Euler(A,xf,T,it0,bx0,bxf,M,N)
%�ⷽ�� A1 u_xx = u_t �� 0 <= x <= xf, 0 <= t <= T
%��ֵ: u(x,0) = it0(x)
% �߽�����: u(0,t) = bx0(t), u(xf,t) = bxf(t)
% M �� x ��ĵȷֶ���
% N �� t ��ĵȷֶ���
dx = xf/M; x = [0:M]'*dx;
dt = T/N; t = [0:N]*dt;
for i = 1:M + 1, u(i,1) = it0(x(i)); end
for n = 1:N + 1, u([1 M + 1],n) = [bx0(t(n)); bxf(t(n))]; end
r = A*dt/dx/dx
r2 = 1 + 2*r;
for i = 1:M - 1
    P(i,i) = r2; %����9.2.9�ľ���
    if i > 1
        P(i - 1,i) = -r; P(i,i - 1) = -r; 
    end
end
for k = 2:N + 1
    b = [r*u(1,k); zeros(M - 3,1); r*u(M + 1,k)] + u(2:M,k - 1); %Eq.(9.2.9)
    u(2:M,k) = linsolve(P,b);
end