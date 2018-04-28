function out = problem2(pos, time)
c = 299792.458;

mat = zeros(3,5);
for i = 1:3
    for j = 1:3
        mat(i,j) = 2*(pos(i+1,j) - pos(1,j));
    end
    mat(i,4) = 2*c*c*(time(1) - time(i+1));
    mat(i,5) =  pos(i+1,1)^2 - pos(1,1)^2    + pos(i+1,2)^2 - pos(1,2)^2     + pos(i+1,3)^2 - pos(1,3)^2    + c*c*(time(1)^2 - time(i+1)^2);
end

rmat = rref(mat);

%ad = rmat(1,4) + rmat(2,4) + rmat(3,4) - c*c;
%bd = rmat(1,4) * (rmat(1,5) + pos(1,1));
%bd = bd + rmat(2,4) * (rmat(2,5) + pos(1,2));
%bd = bd + rmat(3,4) * (rmat(3,5) + pos(1,3));
%bd = 2 * (bd + c*c*time(1));
%cd = (rmat(1,5) + pos(1,1))^2 + (rmat(2,5) + pos(1,2))^2 + (rmat(3,5) + pos(1,3))^2;
%cd = cd + c*c*pos(1,1)*pos(1,1);

ad = (rmat(1,4)^2) + (rmat(2,4)^2) + (rmat(3,4)^2) - (c^2);
bd = 2*((rmat(1,4)*pos(1,1)) + (rmat(2,4)*pos(1,2)) + (rmat(3,4)*pos(1,3)) - (time(1)*(c^2)));
cd = ((rmat(1,5)^2) + (rmat(2,5)^2) + (rmat(3,5)^2)) - (2*((rmat(1,5)*pos(1,1)) + (rmat(2,5)*pos(1,2)) + (rmat(3,5)*pos(1,3)))) + ((pos(1,1)^2) + (pos(1,2)^2) + (pos(1,3)^2) + ((c^2)*(time(1)^2)));

[dlo, dhi] = Quadratic(ad, bd, cd);
x = -rmat(1,4)*dhi + rmat(1,5);
y = -rmat(2,4)*dhi + rmat(2,5);
z = -rmat(3,4)*dhi + rmat(3,5);

out = [x, y, z, dhi];
end

