function out = jacobian(S1, S2, S3, S4, x, y, z)
matrix = zeros(4, 4);
c = 299792.458;
matrix(1,1) = (x - 15600)/S1;
matrix(1,2) = (y - 7540)/S1;
matrix(1,3) = (z - 20140)/S1;
matrix(1,4) = c;
matrix(2,1) = (x - 18760)/S2;
matrix(2,2) = (y - 2750)/S2;
matrix(2,3) = (z - 18610)/S2;
matrix(2,4) = matrix(1,4);
matrix(3,1) = (x - 17610)/S3;
matrix(3,2) = (y - 14630)/S3;
matrix(3,3) = (z - 13480)/S3;
matrix(3,4) = matrix(2,4);
matrix(4,1) = (x - 19170)/S4;
matrix(4,2) = (y - 610)/S4;
matrix(4,3) = (z - 18390)/S4;
matrix(4,4) = matrix(3,4);

out = matrix;
end