clear
close


I = imread('plateV3.jpg');

Icorrected = imtophat(I,strel('disk',15));
BW1 = imbinarize(I);

MonoChrome=im2bw(I,0.15);

resultsMonoChorme = ocr(MonoChrome,'TextLayout','Block');
stringx = resultsMonoChorme.Text;

bboxes = locateText(resultsMonoChorme,stringx,IgnoreCase=true);
Iocr = insertShape(I,"FilledRectangle",bboxes);
figure; 

%%%%%%%%%%%%%%%%%%%%%%
rgb = imread('wheelv4.jpg');
wheel_diameter = 44;
x = 0.24;

gray_image = rgb2gray(rgb);

[centers,radii] = imfindcircles(rgb,[50 350],'ObjectPolarity','bright', 'Sensitivity',0.9)

radius = radii * x;


subplot(3,2,2)
imshow(rgb)
title('Oryginal')

subplot(3,2,4)
imshow(gray_image)
title('Mono chrome')

fprintf('%i\n', radius)

subplot(3,2,6)
imshow(rgb)
title(radius)
viscircles(centers,radii);


subplot(3,2,1)
imshow(I)
title('Oryginal')

subplot(3,2,3)
imshow(MonoChrome)
title('Mono chrome')

subplot(3,2,5)
imshow(Iocr)
title(stringx)