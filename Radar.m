tic
[imagen,color]=imread('images/200620171710.gif');
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
imagenResClean=imagenRes.*abs(1-base);

%pause(2);
umbral = 10;
for i=length(colors):-1:1
    if colors(i)==umbral
        fprintf('Salgo de la ejecucion\n');
        return;
    end
    if any(any(imagenResClean==colors(i)))
        base = imagenResClean==colors(i) | imagenResClean==colors(i-1);
        fprintf('Color %d corresponde a %d\n',i,colors(i));
        %imshow(base);
        %pause(5);        
        break;
    end   
end
[imgBase,num]=bwlabel(base);
positions = zeros(2,num);
for i=1:1:num
    positions(:,i) = [mean(floor(find(imgBase==i)/480));mean(mod(find(imgBase==i),480))];
end

positionsRes = positions;
for i=1:1:num
    for j=i+1:1:num
        dist = norm(positionsRes(:,i)-positionsRes(:,j));
        if dist<=10
            positionsRes(:,i) = (positionsRes(:,i)+positionsRes(:,j))/2;
            positionsRes(:,j) = positionsRes(:,i);
        end
    end
end

[li,in]=unique(positionsRes(1,:));
positionsFin = zeros(2,length(in));
for i=1:1:length(in)
    positionsFin(:,i) = [li(1,i);positionsRes(2,in(i))];
end
image(imagenRes);
colormap(color);
hold
scatter(positionsFin(1,:),positionsFin(2,:),100,'md','filled');
hold
toc