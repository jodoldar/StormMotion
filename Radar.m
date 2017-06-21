tic
[imagen,color]=imread('images/200620171710.gif');
pos=1;
colors = zeros(1,11);
for i=146:24:386
    colors(pos)=imagen(508,i);
    pos = pos+1;
end
todos = 1:1:length(color);
sobra = setdiff(todos,colors);
imagenRes = imagen;
for j=unique(sobra)
    imagenRes(imagen==j)=0;
end
image(imagenRes);
colormap(color);
%pause(2);
imagenRes = imcrop(imagenRes,[0 0 485 480]);
image(imagenRes);
colormap(color);
pause(2);

[Al,An] = size(imagenRes);
for k=1:1:length(colors)
    image(imagenRes==colors(k));
    colormap(color);
    pause(1);
end
toc