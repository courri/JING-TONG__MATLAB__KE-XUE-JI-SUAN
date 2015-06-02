function [u,x,y] = Helmholtz_Newton(f,g,dbx,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter)
%�ⷽ�̣� u_xx + u_yy + g(x,y)u = f(x,y)
% �Ա���ȡֵ���� D = [x0,xf,y0,yf] = {(x,y) |x0 <= x <= xf, y0 <= y <= yf}
% �߽�����
% u(x0,y) = bx0(y), u(xf,y) = bxf(y)
% u(x,y0) = by0(x), u(x,yf) = byf(x)
% x�����ΪMx��
% y�����ΪMy�� 
% tol �������
% MaxIter: ����������
x0 = D(1); xf = D(2); y0 = D(3); yf = D(4);
dx = (xf - x0)/Mx; x = x0 + [0:Mx]*dx;%�����ڵ�����
dy = (yf - y0)/My; y = y0 + [0:My]'*dy;
Mx1 = Mx + 1; My1 = My + 1;
for i = 1:My
    for j = 1:Mx
         F(i,j) = f(x(j),y(i)); G(i,j) = g(x(j),y(i));
    end
end
for i=1:My
    DBX(1,i)=dbx(x(1),y(i));
end
dx2 = dx*dx; dy2 = dy*dy; dxy2 = 2*(dx2 + dy2);
rx = dx2/dxy2; ry = dy2/dxy2; rxy = rx*dy2;

%�߽�����
for m = 1:My1
    u(m,[1 Mx1])=[bx0(y(m)) bxf(y(m))]; %���ұ߽�
end
for n = 1:Mx1
    u([1 My1],n) = [by0(x(n)); byf(x(n))];%���±߽�
end 

%�߽�ƽ��ֵ��������ֵ
sum_of_bv = sum(sum([u(2:My,[1 Mx1]) u([1 My1],2:Mx)']));
u(2:My,2:Mx) = sum_of_bv/(2*(Mx + My - 2))
for itr = 1:MaxIter
    for m = 2:(My1-1)
        u(m,1)=2*ry*u(m,2)+rx*(u(m+1,1)+u(m-1,1))+rxy*(G(m,1)*u(m,1)-F(m,1)-2*dbx(x(1),y(m))/dx);
    end
    for m=2:(Mx1-1)
        u(1,m)=ry*(u(1,m+1)+u(1,m-1))+2*rx*u(2,m)+rxy*(G(1,m)*u(1,m)-F(1,m)-2*dbx(x(m),y(1))/dy);
    end
    for j = 2:Mx
        for i = 2:My
            u(i,j) = ry*(u(i,j + 1)+u(i,j - 1)) + rx*(u(i + 1,j)+u(i - 1,j))+ rxy*(G(i,j)*u(i,j)- F(i,j)); %������ʽ
        end
    end
    if itr > 1 & max(max(abs(u - u0))) < MinErr%ѭ����������
        break; 
    end
    u0 = u;
end