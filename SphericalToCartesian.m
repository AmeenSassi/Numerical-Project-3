function [outA, outB, outC] = SphericalToCartesian(r, pitch, yaw)
    cosp = cos(pitch);
    outA = r*cosp*cos(yaw);
    outB = r*cosp*sin(yaw);
    outC = sin(pitch);
end