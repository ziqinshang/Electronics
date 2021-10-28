clear all;
Fo = 144; % Removed Frequency
Fs = 400;  % Sampling Frequency
w1 = 2*pi*20/Fs;  % for finding bo value that keeps frequencies between 0 -20 Hz
wo = 2*pi*Fo/Fs; % converting to rad/s
r = 0.9025; %arbitrary value of r
a_w = 1 - 2*cos(wo)*exp(-1i*w1)+ exp(-2i*w1); % Num @ w = w1
b_w = 1 - 2*r*cos(wo)*exp(-1i*w1)+r^2*exp(-2i*w1); % Den @ w = w1
bo = abs(b_w)/abs(a_w);
numNotch = bo*[1 -2*cos(wo) 1];
denNotch = [1 -2*r*cos(wo) r^2];
fvtool(numNotch , denNotch);
