function is = shuffle(is)
%打乱染色体次序
N = length(is);
for n = N:-1:2
    in = ceil(rand*(n - 1));
    tmp = is(in);is(in) = is(n); is(n) = tmp; %将第n个元素与第in个元素交换
end