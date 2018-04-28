function [xlow, xhigh] = Quadratic(a, b, c)
    d = -b/2/a;
    e = sqrt(b*b-4*a*c)/2/a;
    xlow = d-e;
    xhigh = d+e;
end

