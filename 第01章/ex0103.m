function ex0103()
t = 0:pi/50:6*pi;
expt = exp(-0.1*t);
xt = expt.*cos(t); yt = expt.*sin(t);
%dividing the screen into 2 x 2 sections
subplot(2,2,1), plot3(xt, yt, t), grid on %helix
subplot(2,2,2), plot3(xt, yt, t), grid on, view([0 0 1])
subplot(2,2,3), plot3(t, xt, yt), grid on, view([2 -4 1])
subplot(2,2,4), plot3(t, yt, xt), grid on, view([0 -4 0])