%Assignment 2

%Question B
im1=imread('rice.png');
T=intermeans_41(im1);

%Question C
Tlevel=T/255;
imbw=im2bw(im1,Tlevel);
imshow(imbw);
%Because this image has a gradiant background color. When applying single 
%threshold generated from the entire image, some darker grains at the 
%buttom has grayscale value below threshold, so these grains are lost. 
%So fix it, we can divide the image into smaller regions and apply different thresholds.


%Questioin D
bwconnected=bwlabel(imbw);
numofgrains=max(bwconnected,[],'all');
%the number of grains is 151

%Question E
%the problem with directly applying to the binary image is that it couts
%all very noisy pixels, could use bwareaopen to remove objects with very
%few pixels, showing below:
imbw2=bwareaopen(imbw,5);
imbw2=imclearborder(imbw2); 
%It's best to combine to imclearborder to 
%remove some noisy pixels at the border
imshow(imbw2);
bwconnected=bwlabel(imbw2,4);
numofgrains=max(bwconnected,[],'all');
%The actual number of grains counted by human is 69. The Question E gives
%number 92. 

