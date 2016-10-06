% Color Histogram Computing: provide your matlab function here that computes color histogram for a given image

function [hist] = getPooledColorHistogram(im, pooling, colorspace) p='Enter the Color Space\n';
colorspace=input(p,'s');
p1='Enter Pooling \n';
pooling=input(p1,'s');
%reading the images
i1=imread('Q:\My Documents\MATLAB\101_ObjectCategories\Leopards\image_0001.jpg'); i2=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dollar_bill\image_0001.jpg'); i3=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dolphin\image_0001.jpg'); i4=imread('Q:\My Documents\MATLAB\101_ObjectCategories\lotus\image_0001.jpg'); i5=imread('Q:\My Documents\MATLAB\101_ObjectCategories\soccer_ball\image_0001.jpg'); i6=imread('Q:\My Documents\MATLAB\101_ObjectCategories\sunflower\image_0001.jpg');
%resizing the images i1=i1(1:128, 1:192, 1:3); i2=i2(1:128, 1:192, 1:3); i3=i3(1:128, 1:192, 1:3); i4=i4(1:128, 1:192, 1:3); i5=i5(1:128, 1:192, 1:3);
i6=i6(1:128, 1:192, 1:3);
%convertingto hsv im1=rgb2hsv(i1); im2=rgb2hsv(i2); im3=rgb2hsv(i3); im4=rgb2hsv(i4); im5=rgb2hsv(i5); im6=rgb2hsv(i6);
image=cat(6,i1,i2,i3,i4,i5,i6); image_hsv=cat(6,im1,im2,im3,im4,im5,im6);
if (colorspace == 'RGB') [h, w, dim]=size(image); if (pooling == '2x1')
im= image(1:(h/2), 1:(w), 1:(dim)); elseif (pooling == '2x2')
im= imgArray(1:(h/2), 1:(w/2), 1:(dim)); elseif (pooling== '3x1')
im= image(1:(h/3), 1:(w), 1:(dim)); else (pooling== '3x3')
im= image(1:(h/3), 1:(w/3), 1:(dim)); end
else if(colorspace == 'HSV')
[h, w, dim]=size(image_hsv); if (pooling== '2x1')
im=image_hsv(1:(h/2), 1:(w), 1:(dim)); elseif (pooling== '2x2')
im= image_hsv(1:(h/2), 1:(w/2), 1:(dim)); elseif (pooling== '3x1')
im= image_hsv(1:(h/3), 1:(w), 1:(dim)); else (pooling== '3x3')
im= image_hsv(1:(h/3), 1:(w/3), 1:(dim)); end
else
a='Enter valid Color Space' disp(a);
end end
figure(1); imhist(im(:,:,1));
figure(2); imhist(im(:,:,2));
figure(3); imhist(im(:,:,3)); return
