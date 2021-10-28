%Group 41 Mingyang Xu 250902744, Maiduo Wu, Ziqing Shang
%By the way, just want u to known, this is a very intereting assignment 
%Surprised that image processing can do so much and get such good result
%:)

im=imread('circuit.tif');
h=ones(1,11)/11;
blurred=uint8(round(filter2(h,im,'valid')));

deblurred=deblur_41(double(blurred),h);
figure;

subplot(1,3,1);
imshow(im);
title('Original');

subplot(1,3,2);
imshow(blurred);
title('Blurred');

subplot(1,3,3);
imshow(deblurred,[]);
title('Deblurred');