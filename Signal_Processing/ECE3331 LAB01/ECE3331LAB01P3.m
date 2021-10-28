load GOOG.MAT
Vavg1(1) = (GOOG(1))/3;
Vavg1(2) = (GOOG(1) + GOOG(2))/3;
Vavg2(1) = 0.15*GOOG(1);
Vavg2(2) = 0.15*GOOG(2) + 0.85*GOOG(1);
Vavg3(1) = GOOG(1)/3;
Vavg3(2) = GOOG(2)/3+Vavg3(1);
for i = 3:1117 
    Vavg1(i) = (GOOG(i)+GOOG(i-1)+GOOG(i-2))/3;
    Vavg2(i) = 0.15*GOOG(i) +0.85*GOOG(i-1);
    if i == 3 
        Vavg3(3) = GOOG(3)/3+Vavg3(2);
    else
         Vavg3(i) = (GOOG(i) - GOOG(i-3))/3+Vavg3(i-1);
    end
end
figure('name', 'GOOG');
plot(GOOG);
figure ('name', 'V average 1');
plot(Vavg1);
hold on 
plot(GOOG);
figure('name','V average 2');
plot(Vavg2);
hold on 
plot(GOOG);
figure('name','V Average 3');
plot(Vavg3);
hold on 
plot(GOOG);

figure('name','Difference methods vs GOOG');
hold on
plot(GOOG);
hold on
plot(Vavg1);
hold on
plot(Vavg2);
hold on
plot(Vavg3);
hold on