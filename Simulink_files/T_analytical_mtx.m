function [TA] = T_analytical_mtx(Phi)
% Phi must contain Euler angles (phi, theta, psi) in ZYZ form
TA = [0 -sin(Phi(1)) cos(Phi(1))*sin(Phi(2));
        0  cos(Phi(1)) sin(Phi(1))*sin(Phi(2));
        1       0             cos(Phi(2))     ];

end