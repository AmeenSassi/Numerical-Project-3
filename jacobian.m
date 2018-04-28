function out = jacobian(S1, S2, S3, S4, x, y, z, pos)
matrix = zeros(4, 4);
c = 299792.458;
matrix(1,1) = (x - pos(1,1))/S1;
matrix(1,2) = (y - pos(1,2))/S1;
matrix(1,3) = (z - pos(1,3))/S1;
matrix(1,4) = c;
matrix(2,1) = (x - pos(2,1))/S2;
matrix(2,2) = (y - pos(2,2))/S2;
matrix(2,3) = (z - pos(2,3))/S2;
matrix(2,4) = matrix(1,4);
matrix(3,1) = (x - pos(3,1))/S3;
matrix(3,2) = (y - pos(3,2))/S3;
matrix(3,3) = (z - pos(3,3))/S3;
matrix(3,4) = matrix(2,4);
matrix(4,1) = (x - pos(4,1))/S4;
matrix(4,2) = (y - pos(4,2))/S4;
matrix(4,3) = (z - pos(4,3))/S4;
matrix(4,4) = matrix(3,4);

out = matrix;
end