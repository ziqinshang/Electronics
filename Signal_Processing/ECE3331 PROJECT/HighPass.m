clear all 
FCut = 143;% Cutoff
Fs = 400;  % Sampling
r = 0.6; %R
%zero
w1 = 2*pi*60/Fs; % another high frequency for correspondence
%pole
wo = 2*pi*FCut/Fs; % converting to cutoff frequency to rad/s
a_w = 1 - 2*cos(w1)*exp(-1i*wo)+ exp(-2i*wo); % Num @ w = w1
b_w = 1 - 2*r*cos(wo)*exp(-1i*wo)+r^2*exp(-2i*wo); % Den @ w = w1
bo =  0.9*(abs(b_w)/abs(a_w));
numHigh = bo*[1 -2*cos(w1) 1];
denHigh = [1 -2*r*cos(wo) r^2];
fvtool(numHigh , denHigh);