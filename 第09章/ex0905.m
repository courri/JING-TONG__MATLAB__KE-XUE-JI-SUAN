function ex0905()
A= 0.5; %����ϵ��
it0 = inline('sin(pi*x)','x'); %��ʼ����
bx0 = inline('0'); bxf = inline('0'); %�߽�����
xf = 2; M = 25; T = 0.1; N = 100;
[u1,x,t] = Grank_Nicholson(A,xf,T,it0,bx0,bxf,M,N); 
mesh(t,x,u1)
xlabel('x')
ylabel('y')
zlabel('U')