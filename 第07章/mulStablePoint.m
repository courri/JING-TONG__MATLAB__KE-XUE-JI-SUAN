function [r,n]=mulStablePoint(x0,eps)
if nargin==1
    eps=1.0e-4;
end

r=myf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=myf(x0);
    tol=norm(r-x0);
    n=n+1;
    if(n>100000)
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
