% Compute Color Bins for Histogram: compute an k-entry color bin of chosen color space, using kmeans() function%

function [codebook] = getColorBins(pixels, K)
%reading the images
i1=imread('Q:\My Documents\MATLAB\101_ObjectCategories\Leopards\image_0001.jpg'); i2=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dollar_bill\image_0001.jpg'); i3=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dolphin\image_0001.jpg'); i4=imread('Q:\My Documents\MATLAB\101_ObjectCategories\lotus\image_0001.jpg'); i5=imread('Q:\My Documents\MATLAB\101_ObjectCategories\soccer_ball\image_0001.jpg'); i6=imread('Q:\My Documents\MATLAB\101_ObjectCategories\sunflower\image_0001.jpg');
%resizing the images i1=i1(1:128, 1:192, 1:3); i2=i2(1:128, 1:192, 1:3); i3=i3(1:128, 1:192, 1:3); i4=i4(1:128, 1:192, 1:3); i5=i5(1:128, 1:192, 1:3);
i6=i6(1:128, 1:192, 1:3);
%convertingto hsv
im1=rgb2hsv(i1);
im2=rgb2hsv(i2);
im3=rgb2hsv(i3);
im4=rgb2hsv(i4);
im5=rgb2hsv(i5);
im6=rgb2hsv(i6);
%concat image=cat(6,im1,im2,im3,im4,im5,im6); [h, w, dim]=size(image);
pixels = double(reshape(image, [w*h, dim])); [i, K]=kmeans(pixels, 16);
%display
figure;
plot3(K(:,1), K(:,2), K(:,3), '*'); grid on; xlabel('H');
ylabel('S');
zlabel('V');
return