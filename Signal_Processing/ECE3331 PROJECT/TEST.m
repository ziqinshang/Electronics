clear all 
FCut = 143;% Cutoff
Fs = 400;  % Sampling
r = 0.6; %R
%pole
w1 = 2*pi*50/Fs; % another high frequency for correspondence
%zero
wo = 2*pi*FCut/Fs; % converting to cutoff frequency to rad/s
a_w = 1 - 2*cos(wo)*exp(-1i*w1)+ exp(-2i*w1); % Num @ w = w1
b_w = 1 - 2*r*cos(w1)*exp(-1i*w1)+r^2*exp(-2i*w1); % Den @ w = w1
bo =  0.9*(abs(b_w)/abs(a_w));
numLow = bo*[1 -2*cos(wo) 1];
denLow = [1 -2*r*cos(w1) r^2];
tf=numLow/denLow;
impulse(tf);