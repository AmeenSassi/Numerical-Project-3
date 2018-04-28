
format long

%Question 1
pos = [ 15600   7540    20140;
        18760   2750    18610;
        17610   14630   13480;
        19170   610     18390   ];
t = [0.07074, 0.07220, 0.07690, 0.07242];
ans1 = problem1(0, 0, 6370, 0, pos, t);
fprintf("Calculated Position: %d, %d, %d\n", ans1(1), ans1(2), ans1(3));
fprintf("Calculated d: %d\n", ans1(4));
disp(ans1);

%Question 2


%Question 4

fprintf("\n")
fprintf("Problem 4\n");
pos = zeros(4,3);
rad = 26570;
pos(1, :) = SphericalToCartesian(rad, 0, pi/2);
pos(2, :) = SphericalToCartesian(rad, pi/3, 0);
pos(3, :) = SphericalToCartesian(rad, pi/3, 2*pi/3);
pos(4, :) = SphericalToCartesian(rad, pi/3, 4*pi/3);

clf;
AnalyzeError(pos);

pause;
%Question 5
fprintf("\n")
fprintf("Problem 5\n");
pos = zeros(4,3);
pos(1, :) = SphericalToCartesian(rad, pi/4 + pi/80, 0);
pos(2, :) = SphericalToCartesian(rad, pi/4, pi/20);
pos(3, :) = SphericalToCartesian(rad, pi/4 - pi/80, 0);
pos(4, :) = SphericalToCartesian(rad, pi/4, -pi/20);

clf;
AnalyzeError(pos);