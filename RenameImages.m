tic
imgNames = dir('ruby_images/*.gif');
numImages = length(imgNames);
month = '06';
year = '2017';
for i=1:1:numImages
    oldName = strcat(imgNames(i).folder,'\',imgNames(i).name);
    currentImg = imread(oldName);
    currentCrop = imcrop(currentImg,[180 519 300 21]);
    currentText = ocr(currentCrop,'TextLayout','Line','Language','Time/tessdata/Time.traineddata','CharacterSet','0123456789');
    day = char(currentText.Words(1));
    hour = char(currentText.Words(4));
    hour = hour(1:4);
    newName = strcat('images/',day,month,year,hour,'.gif');
    movefile(oldName,newName);
end
toc