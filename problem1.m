function out = problem1(x, y , z, d, pos, t)

c = 299792.458;
r = zeros(4, 1);
m = zeros(4, 4);

for i = 1:5
    S1 = sqrt((x-(pos(1,1)))^(2)+(y-(pos(1,2)))^(2)+(z-(pos(1,3)))^(2));
    S2 = sqrt((x-(pos(2,1)))^(2)+(y-(pos(2,2)))^(2)+(z-(pos(2,3)))^(2));
    S3 = sqrt((x-(pos(3,1)))^(2)+(y-(pos(3,2)))^(2)+(z-(pos(3,3)))^(2));
    S4 = sqrt((x-(pos(4,1)))^(2)+(y-(pos(4,2)))^(2)+(z-(pos(4,3)))^(2));

    m = jacobian(S1, S2, S3, S4, x, y, z, pos);

    s1 = S1 - c*(t(1) - d);
    s2 = S2 - c*(t(2) - d);
    s3 = S3 - c*(t(3) - d);
    s4 = S4 - c*(t(4) - d);

    r(1,1) = s1;
    r(2,1) = s2;
    r(3,1) = s3;
    r(4,1) = s4;

    s = m\r;

    x = x - s(1);
    y = y - s(2);
    z = z - s(3);
    d = d - s(4);
end

out = [x, y, z, d];
end