time = 0:0.001:1; % sample frequency is 1 kHz
fs = 500; % Signal frequency is 500 Hz
sig1 = sin(fs*pi*time); %no offset
sig2 = sin(fs*pi*time + 0.1); %offset of 0.1
figure('name','No Offset');
stem(time, sig1);
figure('name','0.1 Offset');
stem(time,sig2);