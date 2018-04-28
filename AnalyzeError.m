function out = AnalyzeError(sat)
c = 299792.458;

target = [0,0,6370];

%Random satellite positions
%sat1 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat2 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat3 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);
%sat4 = SphericalToCartesian(rad, rand()*pi/2, rand()*pi*2);

dtdiffs = [];   %The maximum differences of t errors
emfs = [];      %The corresponding emfs
maxEmf = 0;
con = 0;
maxErr = 0;

for i = 1:1000
    t = [];
    dt = [];
    for j = 1:4
        dt(j) = (rand()*2-1)^2 * 10^-8;
        t(j) = norm(sat(j,:) - target) / c + dt(j);
    end
    
    expectation = problem1(0, 0, 6370, 0.0001, sat, t);
    emf = norm(expectation(1:3) - target) / norm(dt) / c;
    
    dtdiffs(i) = max(dt)-min(dt);
    emfs(i) = emf;
    
    if (emf > maxEmf)
        maxEmf = emf;
    end
    
    maxErr = max(norm(expectation(1:3) - target), maxErr);
end

plot(dtdiffs, emfs, 'o'); hold on
fprintf("Estimated Condition Number: %d\n", maxEmf);
fprintf("Maximum Error Encountered: %d kilometers\n", maxErr);

end