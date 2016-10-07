run('Q:\My Documents\MATLAB\VLFEATROOT\toolbox\vl_setup')
%reading the images
i1=imread('Q:\My Documents\MATLAB\101_ObjectCategories\Leopards\image_0001.jpg'); i2=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dollar_bill\image_0001.jpg'); i3=imread('Q:\My Documents\MATLAB\101_ObjectCategories\dolphin\image_0001.jpg'); i4=imread('Q:\My Documents\MATLAB\101_ObjectCategories\lotus\image_0001.jpg'); i5=imread('Q:\My Documents\MATLAB\101_ObjectCategories\soccer_ball\image_0001.jpg'); i6=imread('Q:\My Documents\MATLAB\101_ObjectCategories\sunflower\image_0001.jpg');
%resizing the images i1=i1(1:128, 1:192, 1:3); i2=i2(1:128, 1:192, 1:3); i3=i3(1:128, 1:192, 1:3); i4=i4(1:128, 1:192, 1:3); i5=i5(1:128, 1:192, 1:3);
i6=i6(1:128, 1:192, 1:3); image=cat(6,i1,i2,i3,i4,i5,i6);
[h, w, dim]=size(image);
disthist= imhist(image(:,:,1));
dist = pdist2(disthist, disthist); [min_dist, pixel_bin_offs]=min(dist');
figure(21); grid on; hold on;
d0 = dist(1:20, 1:20); d1 = dist(1:20, 21:160);
[tp, fp, tn, fn]= getPrecisionRecall(d0(:), d1(:), 40);
plot(fp./(tn+fp), tp./(tp+fn), '.-k', 'DisplayName', 'tpr-fpr color, data set 1');
p='Enter the number for HOG\n1.)Leopard\n2.)dollar_bill\n3.)dolphin\n4.)lotus\n5.)soccer_ball\n6.)sunflower\n'; opt=input(p,'s')
if (opt == '1')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\Leopards'); elseif (opt == '2')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\dollar_bill'); elseif (opt == '3')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\dolphin'); elseif (opt == '4')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\lotus'); elseif (opt == '5')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\soccer_ball'); elseif (opt == '6')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\sunflower');
else
    folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\kangaroo'); end
 
 
filePattern = fullfile(folder, '*.jpg'); f=dir(filePattern)
files={f.name}
for k=1:numel(files)
fullFileName = fullfile(folder, files{k}) cellArrayOfImages{k,:}=imread(fullFileName)
drawnow; end
for i= 1:67
cellSize=12;
hogw{i,:} = vl_hog(single(rgb2gray(cellArrayOfImages{k,:})),cellSize, 'verbose',
'variant','dalaltriggs') ; [n,m, kd]=size(hogw{i,:});
mhogg{i,:} = mean(reshape(hogw{i,:}, [n*m, kd]));
hog_im = vl_hog('render', hogw{i,:}, 'verbose', 'variant', 'dalaltriggs') ;
end dist1=pdist2(hog_im,hog_im);
d10 = dist1(1:20, 1:20); d11 = dist1(1:20, 21:160);
[tp, fp, tn, fn]= getPrecisionRecall(d10(:), d11(:), 40);
plot(fp./(tn+fp), tp./(tp+fn), '.-b', 'DisplayName', 'tpr-fpr hog, data set 1');
s1 = std(dist(find(~isnan(dist)))); s2 = std(dist1(:)); dist1=dist1(1:256, 1:256); dist_final = dist/s1 + dist1/s2;
d0 = dist_final(1:20, 1:20); d1 = dist_final(1:20, 21:160);
[tp, fp, tn, fn]= getPrecisionRecall(d0(:), d1(:), 40);
plot(fp./(tn+fp), tp./(tp+fn), '.-r', 'DisplayName', 'tpr-fpr color+hog, data set 1');
legend('color', 'hog', 'color+hog', 0);