function ex0109()
N = 100000; 
a = [1:N]; 
x = 1;
tic % initialize the timer
p1 = sum(a.*x.^[N-1:-1:0]); %plain multiplication
p1, toc % measure the time passed from the time of executing ¡¯tic¡¯
tic, p2=a(1);
for i = 2:N %nested multiplication
    p2 = p2*x + a(i);
end
p2, toc
tic, p3=polyval(a,x), toc