function [x,n]=fastdown(A,b,x0,eps)
if(nargin == 3)
    eps = 1.0e-6;
end

r  = b-A*x0;
d  = dot(r,r)/dot(A*r,r);
x  = x0+d*r;
n=1;

while(norm(x-x0)>eps)
    x0 = x;
    r  = b-A*x0;
    d  = dot(r,r)/dot(A*r,r);
    x  = x0+d*r;
    n  = n + 1;
end