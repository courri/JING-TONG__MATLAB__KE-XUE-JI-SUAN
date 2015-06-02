function [r,n]=mulVNewton(x0,A,eps)
if nargin==1  
    A=eye(length(x0));
else
    if nargin==2
        eps=1.0e-4;
    end
end

r=x0-myf(x0)/A;
n=1;
tol=1;
while tol>eps
    x0=r;
    r=x0-myf(x0)/A;
    y=r-x0;
    z=myf(r)-myf(x0);
    A1=A+(z-y*A)'*y/norm(y);
    A=A1;
    n=n+1;
    if(n>100000)
        disp('迭代步数太多，可能不收敛！');
        return;
    end
    tol=norm(r-x0);
end