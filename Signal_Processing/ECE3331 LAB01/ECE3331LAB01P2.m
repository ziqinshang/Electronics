
freq = [100 25 12 8 5];
figure('name','discrete sinusoidal signal with Various Sampling Frequencies');
for i =1:5 
    t = 0:1/freq(i):1;
    sig = sin(8*pi*t);
    stem(t,sig);
    hold on;
end