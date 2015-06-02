function l = wilkqrtz(A,M)

A = hess(A);
for(i=1:M)
    N = size(A);
    n = N(1,1);
    A1 = A((n-1):n,(n-1):n);
    t = Chapoly(A1);
    if(imag(t(1,1)) == 0 && imag(t(2,1)) == 0)   %��������ֵ�Ƿ�Ϊʵ��
        if(abs(t(1,1)-A(n,n))<abs(t(1,1)-A(n,n)))
            u = t(1,1);
        else
            u = t(2,1);               %ѡ��ӽ�A(n,n)���Ǹ���Ϊu
        end
    else
        u = A(n,n);                     %�����������ֵ��һ��Ϊ����,ȡA(n,n)��Ϊu
    end
    
    [q,r]=qr(A-u*eye(n,n));
    A = r*q+u*eye(n,n);
    l = diag(A);
end
