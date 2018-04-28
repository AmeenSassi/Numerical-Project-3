function [condition, maxError] = AnalyzeError(sat, render)
c = 299792.458;

target = [0,0,6370];

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

if (render)
    plot(dtdiffs, emfs, 'o');
    xlabel('Range on Input Error');
    ylabel('emf');
end

condition = maxEmf;
maxError = maxErr;

end