
format long

%Question 1
pos = zeros(4,3);
pos(1,1) = 15600;
pos(1,2) = 7540;
pos(1,3) = 20140;
pos(2,1) = 18760;
pos(2,2) = 2750;
pos(2,3) = 18610;
pos(3,1) = 17610;
pos(3,2) = 14630;
pos(3,3) = 13480;
pos(4,1) = 19170;
pos(4,2) = 610;
pos(4,3) = 18390;
t = [0.07074, 0.07220, 0.07690, 0.07242];
ans1 = problem1(0, 0, 6370, 0, pos, t);
disp(ans1);


%Question 4
