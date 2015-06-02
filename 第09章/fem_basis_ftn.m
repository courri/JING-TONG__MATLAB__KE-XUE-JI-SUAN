function p = fem_basis_ftn(N,S)
%p(i,s,1:3): ������ ftn phi_iϵ��
% ��s��������
%N(n,1:2) : ��n���ڵ��x��y����
%S(s,1:3) : ��s��������Ľڵ�#s
N_n = size(N,1); %�ܹ��ڵ���
N_s = size(S,1); % �����������
for n = 1:N_n
    for s = 1:N_s
        for i = 1:3
            A(i,1:3) = [1 N(S(s,i),1:2)];
            b(i) = (S(s,i) == n); %The nth basis ftn is 1 only at node n.
        end
        pnt=A\b';
        for i=1:3, p(n,s,i) = pnt(i); end
    end
end