%ģ���˻��е�mu^��-1������
function x = Mu_Inv(y,mu) 
x = (((1+mu).^abs(y)- 1)/mu).*sign(y);