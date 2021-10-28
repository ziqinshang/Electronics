load GOOG.MAT
load GOOG.MAT
h1 = [ 1/3 1/3 1/3 0 0 0 0 0 0 0];
h2(1) = 0.15;
for i =2:10 
    h2(i) = h2(i-1)*.85;
end
h3 = [ 1/3 1/3 1/3 0 0 0 0 0 0 0];
Vavg1(1) = (GOOG(1))/3;
Vavg1(2) = (GOOG(1) + GOOG(2))/3;
Vavg2(1) = 0.15*GOOG(1);
Vavg2(2) = 0.15*GOOG(2) + 0.85*GOOG(1);
Vavg3(1) = GOOG(1)/3;
Vavg3(2) = GOOG(2)/3+Vavg3(1);
for i = 3:1117 
    Vavg1(i) = (GOOG(i)+GOOG(i-1)+GOOG(i-2))/3;
    Vavg2(i) = 0.25*GOOG(i) +0.75*GOOG(i-1);
    if i == 3 
        Vavg3(3) = GOOG(3)/3+Vavg3(2);
    else
         Vavg3(i) = (GOOG(i) - GOOG(i-3))/3+Vavg3(i-1);
    end
end
figure('name', 'Average values');
hold on
plot(GOOG);
hold on
plot(Vavg1);
hold on
plot(Vavg2);
hold on
plot(Vavg3);
hold on

conv1 = conv(GOOG,h1);
conv2 = conv(GOOG,h2);
conv3 = conv(GOOG,h3);

figure('name','Convolution vs Average Method 1');
hold on
plot(Vavg1, 'blue');
hold on 
plot(conv1,'red');
figure('name','Convolution vs Average Method 2');

hold on
plot(Vavg2, 'blue');
hold on 
plot(conv2,'red');
figure('name','Convolution vs Average Method 3');

hold on
plot(Vavg3, 'blue');
hold on 
plot(conv3,'red');