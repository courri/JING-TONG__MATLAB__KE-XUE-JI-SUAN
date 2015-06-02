function l = wilkqrtz(A,M)

A = hess(A);
for(i=1:M)
    N = size(A);
    n = N(1,1);
    A1 = A((n-1):n,(n-1):n);
    t = Chapoly(A1);
    if(imag(t(1,1)) == 0 && imag(t(2,1)) == 0)   %两个特征值是否为实数
        if(abs(t(1,1)-A(n,n))<abs(t(1,1)-A(n,n)))
            u = t(1,1);
        else
            u = t(2,1);               %选最接近A(n,n)的那个作为u
        end
    else
        u = A(n,n);                     %如果两个特征值有一个为复数,取A(n,n)作为u
    end
    
    [q,r]=qr(A-u*eye(n,n));
    A = r*q+u*eye(n,n);
    l = diag(A);
end
