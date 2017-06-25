A = imread('images/230620171720.gif');
B = imread('images/230620171730.gif');
[lon,anc]=size(A);
D = uint8(zeros(411,640));
for i = 2:lon
    for j = 2:anc
        if A(i,j) == B(i,j)
            D(i,j) = A(i,j);
        else
            D(i,j) = 255;
        end
    end
end

imshow(D*1);