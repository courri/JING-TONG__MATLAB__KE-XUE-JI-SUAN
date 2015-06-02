function ex0905()
A= 0.5; %方程系数
it0 = inline('sin(pi*x)','x'); %初始条件
bx0 = inline('0'); bxf = inline('0'); %边界条件
xf = 2; M = 25; T = 0.1; N = 100;
[u1,x,t] = Grank_Nicholson(A,xf,T,it0,bx0,bxf,M,N); 
mesh(t,x,u1)
xlabel('x')
ylabel('y')
zlabel('U')