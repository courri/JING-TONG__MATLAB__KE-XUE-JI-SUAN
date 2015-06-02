function ex0111(n)
if n<0
    error('input must be positive,stopped');
end
m = 1;
tic
for k = 2:n
    m = m*k;
end
toc
m
