function [TA] = Tdot_analytical(Phi)
% Phi must contain Euler angles (phi, theta, psi) in ZYZ form
a = Phi(1);
b = Phi(2);
c = Phi(3);

TA = [[0, -cos(a), cos(a)*cos(b) - sin(a)*sin(b)]
        [0, -sin(a), cos(a)*sin(b) + cos(b)*sin(a)]
        [0,       0,                       -sin(b)]];

end