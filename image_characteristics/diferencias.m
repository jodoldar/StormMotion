A = imread('espana2.png');
B = imread('espana3.1.png');
C = A==B;
D = zeros(411,640);
for i = 2:410
    for j = 2:639
         D(i,j) = C(i,j);
         if(C(i,j)== 0)
            if(cell_1_1(C,i,j))
                D(i,j) = 1;  
            end
         end
    end
end
imshow(D*1);
imwrite(D,'myGray.png')

function obj = cell_1_1(value,i,j)
    obj =  ((value(i-1,j-1)) == 0) & (cell_1_2(value,i,j));          
end

function obj = cell_1_2(value,i,j)
    obj =  ((value(i,j-1)) == 0) & (cell_1_3(value,i,j));       
end

function obj = cell_1_3(value,i,j)
    obj =  ((value(i+1,j-1)) == 0) & (cell_2_1(value,i,j));       
end

function obj = cell_2_1(value,i,j)
    obj = (value(i+1,j) == 0) & (cell_2_3(value,i,j));       
end

function obj = cell_2_3(value,i,j)
    obj =  ((value(i-1,j) == 0) & (cell_3_1(value,i,j)));       
end

function obj = cell_3_1(value,i,j)
    obj =  ((value(i-1,j+1) == 0) & (cell_3_2(value,i,j)));       
end

function obj = cell_3_2(value,i,j)
    obj =  ((value(i,j+1) == 0) & (cell_3_3(value,i,j)));       
end

function obj = cell_3_3(value,i,j)
   obj  =  (value(i+1,j+1) == 0);     
end
