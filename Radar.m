tic
[imagen,color]=imread('images/230620171730.gif');
[base,colorBase]=imread('BaseProvincias.gif');
load('BaseProvincias.mat');
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
%pause(2);
[Al,An] = size(imagenRes);
for k=1:1:length(colors)
    image(imagenRes==colors(k));
    colormap(color);
    %pause(1);
end
imagenRes=imagenRes.*abs(1-base);

%pause(2);
umbral = 10;
for i=length(colors):-1:1
    if colors(i)==umbral
        fprintf('Salgo de la ejecucion\n');
        return;
    end
    if any(any(imagenRes==colors(i)))
        base = imagenRes==colors(i);
        fprintf('Color %d corresponde a %d\n',i,colors(i));
        break;
    end   
end
[imgBase,num]=bwlabel(base);
positions = zeros(2,num);
for i=1:1:num
    positions(:,i) = [mean(floor(find(imgBase==i)/480));mean(mod(find(imgBase==i),480))];
end
image(imagenRes);
colormap(color);
hold
scatter(positions(1,:),positions(2,:),100,'md','filled');
hold
toc