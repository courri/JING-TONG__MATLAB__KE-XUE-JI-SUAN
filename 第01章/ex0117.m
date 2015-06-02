function ex0117(ftn,bounds,varargin)
if nargin < 2
    bounds = [-1 1];
end
b1 = bounds(1); b2 = bounds(2);
t = b1 + [0:100]/100*(b2 - b1);
x = feval(ftn,t,varargin{:});
plot(t,x)