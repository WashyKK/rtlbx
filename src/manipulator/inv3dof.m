function [rotm] = inv3dof(x, y, z)
    rx = atan(-1*(x/y));
    if rx == 0
        rz = acos( ((y/cos(rx))^2 + z^2 - 162 )/162);
    else
        rz = acos( ((x/sin(rx))^2 + z^2 - 162 )/162);
    end
    ry = acos( (z * cos(rx) * ( 1 + cos(rz) + y * sin(rz) )) / (18 * (1 + cos(rz)) * cos(rx)) );
    rotm = [rx ry rz];
end
