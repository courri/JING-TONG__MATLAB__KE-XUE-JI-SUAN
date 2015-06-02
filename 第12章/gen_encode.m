function P = gen_encode(X,Nb,l,u)
%��Ⱥ��X��״̬����Ϊ����������P
Np=size(X,1); %Ⱥ���С
N = length(Nb); %������״̬��ά��
for n = 1:Np
    b2 = 0;
    for m = 1:N
        b1 = b2+1;
        b2 = b2 + Nb(m);
        Xnm =(2^Nb(m)- 1)*(X(n,m) - l(m))/(u(m) - l(m)); %���뷽��
        P(n,b1:b2) = dec2bin(Xnm,Nb(m)); %10����ת��Ϊ2����
    end
end