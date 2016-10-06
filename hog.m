%HoG extraction and aggregation, default aggregation is the average of HoG among cells.

function [hog] = getHoGAggregation(im, cell_size, opt)
run('Q:\My Documents\MATLAB\101_ObjectCategories\VLFEATROOT\toolbox\vl_setup') p='Enter the number for HOG\n1.)Leopard\n2.)dollar_bill\n3.)dolphin\n4.)lotus\n5.)soccer_ball\n6.)sunflower\n'; opt=input(p,'s')
if (opt == '1')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\Leopards'); elseif (opt == '2')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\dollar_bill'); elseif (opt == '3')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\dolphin'); elseif (opt == '4')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\lotus'); elseif (opt == '5')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\soccer_ball'); elseif (opt == '6')
folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\sunflower'); else folder = ('Q:\My Documents\MATLAB\101_ObjectCategories\kangaroo'); end
filePattern = fullfile(folder, '*.jpg'); f=dir(filePattern)
files={f.name}
for k=1:numel(files)
fullFileName = fullfile(folder, files{k}) cellArrayOfImages{k,:}=imread(fullFileName) drawnow;
end
for i= 1:67
cellSize=12;
hog{i,:} = vl_hog(single(rgb2gray(cellArrayOfImages{k,:})),cellSize, 'verbose', 'variant','dalaltriggs') ; [n,m, kd]=size(hog{i,:});
mhog{i,:} = mean(reshape(hog{i,:}, [n*m, kd]));
hog_im{i,:} = vl_hog('render', hog{i,:}, 'verbose', 'variant', 'dalaltriggs') ;
size(mhog{i,:}); figure(1); imagesc(hog_im{i,:}); figure(2); imagesc(mhog{i,:}); colormap('gray'); end
return