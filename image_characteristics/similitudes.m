A = imread('espana2.png');
B = imread('espana3.3.png');
D = uint8(zeros(411,640));
for i = 2:410
    for j = 2:639
        if A(i,j) == B(i,j)
            D(i,j) = A(i,j);
        else
            D(i,j) = 255;
        end
    end
end

imshow(D*1);