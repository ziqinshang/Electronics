%QUESTION FIVE
clear;
Fs=20;
Ts=1/Fs;
t=0:Ts:1;
x_test=zeros(1,length(t));
x_test(1)=0;
for i=2:length(t)
    if (i<=10)
        x_test(i)=sin(pi*(i-1)/10);
    else
        x_test(i)=0;
    end
end
subplot(2,1,1);
stem(t,x_test);
x_test_DTFT = dtft(x_test,0.01);
subplot(2,1,2);
plot(-pi:0.01:pi,abs(x_test_DTFT));
%QUESTION SIX
%SUPPRESS THE FOLLOWING COMPONENT TO OBTIAN ANSWER FOR Q5
subplot(3,1,3);
plot(-10:0.01*20/(2*pi):10,abs(x_test_DTFT));
%END OF Q6
function DTFT = dtft(sig_in, freq_res)
w = -pi:freq_res:pi;
x = zeros(1,length(w));
for a = 1:length(w)
    for b=1:length(sig_in)
        x(a) = x(a) + sig_in(b) * exp(-1i*w(a)*b);
    end
end
DTFT = x;
end