function out = problem4()
c = 299792.458;

rad = 26570;
target = [0,0,6370];
d = 0.0001;

sat = zeros(4);

sat(1) = SphericalToCartesian(rad, 0, pi/2);
sat(2) = SphericalToCartesian(rad, pi/3, 0);
sat(3) = SphericalToCartesian(rad, pi/3, 2*pi/3);
sat(4) = SphericalToCartesian(rad, pi/3, 4*pi/3);

%Random satellite positions
%sat1 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat2 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat3 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat4 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);


%Satellite Ranges
R1 = sqrt(((sat(1, 1))^(2))+((sat(1, 2))^(2))+((sat(1, 3)-6370)^(2))); 
R2 = sqrt(((sat(2, 1))^(2))+((sat(2, 2))^(2))+((sat(2, 3)-6370)^(2)));
R3 = sqrt(((sat(3, 1))^(2))+((sat(3, 2))^(2))+((sat(3, 3)-6370)^(2)));
R4 = sqrt(((sat(4, 1))^(2))+((sat(4, 2))^(2))+((sat(4, 3)-6370)^(2)));

dtnorms = zeros(100);    %The norms of the t error
emfs = zeros(100);      %The corresponding emfs


for i = 1:100
    t = zeros(4);
    dt = zeros(4);
    for j = 1:4
        dt(j) = (rand()*2-1) * 10^-8;
        t(j) = norm(sat(j,:) - target) / c + dt(j);
    end
    
    expectation = problem1(0, 0, 6370, 0.0001, sat, t);
    emf = norm(expectation - target) / norm(dt) / c;
    
    dtnorms(i) = norm(dt);
    emfs(i) = emf;
end


end