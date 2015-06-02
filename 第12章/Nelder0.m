function [xo,fo] = Nelder0(f,abc,fabc,TolX,TolFun,k)
%二维空间中的多边形逼近
if nargin < 6
    k = 100;
end
if nargin < 5
    TolFun = 1e-8;
end
if nargin < 4
    TolX = 1e-5;
end

%%%%确定三个顶点a，b，c并且其函数值按从小到大排列
[fabc,I] = sort(fabc); %将二维空间中的多边形三个顶点的函数值按从小到大顺序排列
a = abc(I(1),:);
b = abc(I(2),:); 
c = abc(I(3),:);
fa = fabc(1); 
fb = fabc(2);
fc = fabc(3);
%%%判断三点或三点函数值的距离是否小于给定阈值.若小于阈值停止循环，得最优解x0=a
fba = fb - fa;  %a,b点函数值之差
fcb = fc - fb;  %b，c点函数值之差
if k <= 0 | abs(fba) + abs(fcb) < TolFun | abs(b - a) + abs(c - b) < TolX
    xo = a;
    fo = fa; %小于阈值
else   %大于阈值，更新多边形顶点
    m = (a + b)/2; 
    e = 3*m - 2*c; %扩展（expansion）
    fe = feval(f,e);
    if fe < fb
        c = e; 
        fc = fe;
    else
        r = (m+e)/2;  %反射（reflection）
        fr = feval(f,r);
        if fr < fc
            c = r;
            fc = fr; 
        end
        if fr >= fb
            s = (c + m)/2; %内收缩（inside contraction）
            fs = feval(f,s);
            if fs < fc
                c = s;
                fc = fs;
            else
                b = m;
                c = (a + c)/2; %变小（shrink）
                fb = feval(f,b);
                fc = feval(f,c);
            end
        end
    end
    [xo,fo] = Nelder0(f,[a;b;c],[fa fb fc],TolX,TolFun,k - 1);
end
