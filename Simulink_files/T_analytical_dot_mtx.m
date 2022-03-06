function [TA] = T_analytical_dot_mtx(angles,angles_dot)
% Phi must contain Euler angles (phi, theta, psi) in ZYZ form



TA =   [0 (-cos(angles(1))*angles_dot(1)) (-sin(angles(1))*sin(angles(2))*angles_dot(1)+ cos(angles(1))*cos(angles(2))*angles_dot(2));
        0  -sin(angles(1))*angles_dot(1) (cos(angles(1))*sin(angles(2))*angles_dot(1)+ sin(angles(1))*cos(angles(2))*angles_dot(2));
        0       0             -sin(angles(2)) * angles_dot(2)    ];

end