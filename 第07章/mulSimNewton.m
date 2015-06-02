function [r,n]=mulSimNewton(x0,eps)
if nargin==1
    eps=1.0e-4;
end

r=x0-myf(x0)/dmyf(x0);
c=dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=x0-myf(x0)/c;
    tol=norm(r-x0);
    n=n+1;
    if(n>100000)
        disp('迭代步数太多，可能不收敛！');
        return;
    end
end