% X INTERVAL
n = [-0.6,-0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5,0.6];
%for -0.5s<=t<=0.5s ,x(t)=1
x = [0,1,1,1,1,1,1,1,1,1,1,1,0];
figure(1);
y = stem(n,x);
