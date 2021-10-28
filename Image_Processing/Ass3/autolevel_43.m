function [im2, a] = autolevel_43( fname )
%autoselect points to level the background
%input autolevel_43(fname) in the command line to auto-level the 
%background of the image, fname is the name of the image needed
%to be processed

im = imread( fname );
imshow(im);
hold on;

sz = size(im);%get the size of the image
row = sz(1);%get how many rows the image needs
col = sz(2);%get how many columns the image needs

%imange is brokent into M * N non-overlapping blocks
M = 8;%Enter value of M here
N = 8;%Enter value of N here
hPixel = row / M;%Calculate how many horizontal pixel one block needs
vPixel = col / N;%calculate how many vertical pixel one block needs
x = zeros(col*row/(hPixel*vPixel),1);%initialize x, an array to contain the values of x-coordinates of the selected points
y = zeros(col*row/(hPixel*vPixel),1);%initialize y, an array to contain the values of y-coordinates of the selected points
I = zeros(col*row/(hPixel*vPixel),1);%initialize I, the grey level of the selected picture
bgPixel = zeros(hPixel,vPixel);%create a 2d array to represent a block of the image
count = 1;%used to input different data in the arrays of x, y, I


for i = 0:1:row/hPixel - 1%cycle through different non-overlapping blocks horizontally
    for j = 0:1:col/vPixel - 1%cycle through different non-overlapping blocks vertically
        for horizontal = 1:1:hPixel%create the block of images
            for vertical = 1:1:vPixel
                bgPixel(horizontal,vertical) = im(i*hPixel+horizontal,j*vPixel+vertical);%create the block to copy the pixels in the original image to the block
            end
        end
        I(count) = min(min(bgPixel));%find the minimum value of row and column
        [Y,X] = find(bgPixel == I (count));%find the position of the minimum value in the block
        x(count) = X(1) + i * hPixel;%input the value in the array by adding the position of pixel in the block to the position of the block
        y(count) = Y(1) + j * vPixel;%input the value in the array by adding the position of pixel in the block to the position of the block
        %X(1) and Y(1) is used since multiple min pixels can have same
        %values, and only one point is needed, so I choose X(1) and Y(1) to
        %acquire only one pixel
        
        bgPixel = zeros(hPixel,vPixel);%re-initialize the block for the picture
        count = count + 1;%Count + 1 so data will be entered into another position in the array
    end
end

plot(x, y, 'y+');%plot the points on the image



%the rest is in the original function of level
vPixel = length(x);
Sx = sum(x);
Sy = sum(y);
Sxx = sum(x.*x);
Syy = sum(y.*y);
Sxy = sum(x.*y);
Sxxx = sum(x.^3);
Sxxy = sum(x.*x.*y);
Sxyy = sum(x.*y.*y);
Syyy = sum(y.^3);
Sxxxx = sum(x.^4);
Sxxxy = sum(y.*x.^3);
Sxxyy = sum(x.*x.*y.*y);
Sxyyy = sum(x.*y.^3);
Syyyy = sum(y.^4);
C = [vPixel    Sx  Sy   Sxx   Syy   Sxy;
    Sx   Sxx Sxy  Sxxx  Sxyy  Sxxy;
    Sy   Sxy Syy  Sxxy  Syyy  Sxyy;
    Sxx Sxxx Sxxy Sxxxx Sxxyy Sxxxy;
    Syy Sxyy Syyy Sxxyy Syyyy Sxyyy;
    Sxy Sxxy Sxyy Sxxxy Sxyyy Sxxyy];
% Construct {k} 
SI = sum(I);
SxI = sum(x.*I);
SyI = sum(y.*I);
SxxI = sum(x.*x.*I);
SyyI = sum(y.*y.*I);
SxyI = sum(x.*y.*I);
k = [SI SxI SyI SxxI SyyI SxyI]';
% Solve
a = C\k;

% Remove background
% First compute background image
[rows, cols] = size(im);
[x, y] = meshgrid( 1:cols, 1:rows );
back = a(1) + a(2)*x + a(3)*y + a(4)*x.*x + a(5)*y.*y +a(6)*x.*y;
im2 = double(im) - back;
im2 = mat2gray(im2); % Convert matrix of type double to image of type double
im2 = im2uint8(im2); % Convert to uint8 image. Although you were not asked
                     % to do this, it is useful to make output same type as
                     % input image.

