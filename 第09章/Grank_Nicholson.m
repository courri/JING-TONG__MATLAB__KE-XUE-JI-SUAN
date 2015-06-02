function [u,x,t] = Grank_Nicholson(A,xf,T,it0,bx0,bxf,M,N)
%解方程 A u_xx = u_t ， 0 <= x <= xf, 0 <= t <= T
%初值: u(x,0) = it0(x)
% 边界条件: u(0,t) = bx0(t), u(xf,t) = bxf(t)
% M ： x 轴的等分段数
% N ： t 轴的等分段数
dx = xf/M; x = [0:M]'*dx;
dt = T/N; t = [0:N]*dt;
for i = 1:M + 1, u(i,1) = it0(x(i)); end
for n = 1:N + 1, u([1 M + 1],n) = [bx0(t(n)); bxf(t(n))]; end
r = A*dt/dx/dx
r1 = 2*(1 - r); r2 = 2*(1 + r);
for i = 1:M - 1
    P(i,i) = r1; %(9.2.17)
    Q(i,i)=r2;
    if i > 1
        P(i - 1,i) = -r; P(i,i - 1) = -r; %(9.2.17)等式左边矩阵
        Q(i - 1,i) = r; Q(i,i - 1) = r;%(9.2.17)等式右边矩阵
    end
end
for k = 2:N + 1
    b=Q*u(2:M,k-1)+[r*(u(1,k)+u(1,k-1));zeros(M-2,1)];
    u(2:M,k) = linsolve(P,b); %(9.2.17)
end