
function x = ex0114(t,D)
global D
%D=1;
t(find(t == 0)) = eps;%zuixiaozhengshu
x = sin(pi*t/D)./(pi*t/D);