function v = SphericalToCartesian(r, pitch, yaw)
    cosp = cos(pitch);
    outA = r*cosp*cos(yaw);
    outB = r*cosp*sin(yaw);
    outC = r*sin(pitch);
    v = [outA outB outC];
end