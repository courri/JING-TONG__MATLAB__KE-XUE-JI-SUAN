function ex0115()
global D
D = 2; 
b1 = -2;
b2 = 2;
t = b1 +[0:100]/100*(b2 - b1);
%passing the parameter(s) through global variables
plot(t, ex0114(t))
