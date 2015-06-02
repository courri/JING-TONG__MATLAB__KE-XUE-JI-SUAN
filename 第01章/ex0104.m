function ex0104()
x = -2:1:2; y = -2:1:2;
[X,Y] = meshgrid(x,y); 
X 
Y
Z = X.^2 + Y.^2;
subplot(2,2,1), mesh(X,Y,Z), grid on 
subplot(2,2,2), mesh(X,Y,Z), view([0,30]), grid on
subplot(2,2,3), contour(X,Y,Z)
subplot(2,2,4), contour3(X,Y,Z,10)