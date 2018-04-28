S = [   15600   7540    20140   0.07074; 
        18760   2750    18610   0.07220; 
        17610   14630   13480   0.07690; 
        19170   610     18390   0.07242     ];

c = 299792.458;

mat = zeros(3,5);
for i = 1:3
    for j = 1:3
        mat(i,j) = 2*(S(i+1,j) - S(1,j));
    end
    mat(i,4) = 2*c*c*(S(1,4) - S(i+1,4));
    mat(i,5) =  S(i+1,1)^2 - S(1,1)^2    + S(i+1,2)^2 - S(1,2)^2     + S(i+1,3)^2 - S(1,3)^2    + c*c*(S(1,4)^2 - S(i+1,4)^2);
end

rmat = rref(mat);

ad = rmat(1,4) + rmat(2,4) + rmat(3,4) - c*c;
bd = rmat(1,4) * (rmat(1,5) + S(1,1));
bd = bd + rmat(2,4) * (rmat(2,5) + S(1,2));
bd = bd + rmat(3,4) * (rmat(3,5) + S(1,3));
bd = 2 * (bd + c*c*S(1,4));
cd = (rmat(1,5) + S(1,1))^2 + (rmat(2,5) + S(1,2))^2 + (rmat(3,5) + S(1,3))^2;
cd = cd + c*c*S(1,1)*S(1,1);

[dlo, dhi] = Quadratic(ad, bd, cd);
x = -rmat(1,4)*dhi + rmat(1,5);
y = -rmat(2,4)*dhi + rmat(2,5);
z = -rmat(3,4)*dhi + rmat(3,5);

disp([x y z dhi]);
disp(dhi);

