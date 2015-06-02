function p=ex0113(a,b)
%两个多项式相加
if nargin==1
    b=zeros(4,1);
elseif nargin==0
    error('empty input');
end
a=a(:).' ;%make sure inputs are polynomial row vectors
b=b(:).' ;
na=length(a) ;%find lengths of a and b
nb=length(b) ;
p=[zeros(1,nb-na) a]+[zeros(1,na-nb) b]; %add zeros as necessary


