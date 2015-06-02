function [r,n]=mulDNewton(x0,eps)
if nargin==1
    eps=1.0e-4;
end

r=x0-myf(x0)/dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    ttol=1;
    w=1;
    F1=norm(myf(x0));
    while ttol>=0
        r=x0-w*myf(x0)/dmyf(x0);
        ttol=norm(myf(r))-F1;
        w=w/2;
    end
    tol=norm(r-x0);
    n=n+1;
    if(n>100000)
        disp('迭代步数太多，可能不收敛！');
        return;
    end
end