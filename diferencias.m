A = imread('images/230620171720.gif');
B = imread('images/230620171730.gif');
C = A==B;
[lon,anc]=size(A);
D = zeros(lon,anc);
for i = 2:lon
    for j = 2:anc
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
