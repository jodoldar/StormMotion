tic
imgNames = dir('images/*.gif');
numImages = length(imgNames);
currentImg = imread(strcat(imgNames(1).folder,'\',imgNames(1).name));

carriedBase = imcrop(currentImg,[0 0 485 480]);
for i=2:1:numImages
    currentImg = imread(strcat(imgNames(i).folder,'\',imgNames(i).name));
    currentImg = imcrop(currentImg,[0 0 485 480]);
    carriedBase = carriedBase&currentImg;
    %imshow(carriedBase);
    %pause(0.5);
end
imwrite(carriedBase,'BaseProvincias.gif');
save('BaseProvincias','carriedBase');
toc