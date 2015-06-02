function ex0106()
a= [1 50 80 30 45 90 100];
af=zeros(1,length(a));
for n = 1:length(a)
    if(a(n)>100)
         af(n) = 2;
        fprintf('\n\a bad data??\n');
    break;    
    elseif a(n) >= 60, af(n) = 1;
    elseif a(n) >= 0, af(n) = 0;
    else %
        af(n) = -1;
        fprintf('\n\a bad data??\n');
    break;
end
end
af