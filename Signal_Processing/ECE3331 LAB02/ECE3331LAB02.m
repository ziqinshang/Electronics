
load GOOG.mat;
interpolation = interp(GOOG,24);
up = upsample(GOOG,24);
down = downsample(GOOG,7);
reconstruction = interp(down,7);
figure('Name', 'Interpolation');
plot(interpolation);
figure('Name', 'Upsample');
plot(up);
figure('Name', 'Downsample');
plot(down);
figure('Name', 'Reconstruction vs GOOG');
plot(reconstruction);
hold on;
plot(GOOG);

