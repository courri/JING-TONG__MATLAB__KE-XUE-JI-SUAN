function P = gen_encode(X,Nb,l,u)
%将群体X的状态编码为二进制数组P
Np=size(X,1); %群体大小
N = length(Nb); %变量（状态）维数
for n = 1:Np
    b2 = 0;
    for m = 1:N
        b1 = b2+1;
        b2 = b2 + Nb(m);
        Xnm =(2^Nb(m)- 1)*(X(n,m) - l(m))/(u(m) - l(m)); %编码方程
        P(n,b1:b2) = dec2bin(Xnm,Nb(m)); %10进制转换为2进制
    end
end