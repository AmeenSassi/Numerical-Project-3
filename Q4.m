%Question 4
c = 299792458;

rad = 26570000;
target = [0,0,6370];
d = 0.0001;

sat = [ SphericalToCartesian(rad, 0, pi/2),
        SphericalToCartesian(rad, pi/3, 0),
        SphericalToCartesian(rad, pi/3, 2*pi/3),
        SphericalToCartesian(rad, pi/3, 4*pi/3) ];

%Random satellite positions
%sat1 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat2 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat3 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat4 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);

dtnorms = zeros(100);    %The norms of the t error
emfs = zeros(100);      %The corresponding emfs
for i = 1:100
    t = zeros(4);
    dt = zeros(4);
    for j = 1:4
        dt(j) = (rand()*2-1) * 10^-8;
        t(j) = norm(sat(j,:) - target) / c + dt(j);
    end
    
    expectation = sat1; %replace with calculations to find position
    emf = norm(expectation - target) / norm(dt) / c;
    
    dtnorms(i) = norm(dt);
    emfs(i) = emf;
end