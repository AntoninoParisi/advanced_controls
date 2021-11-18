

function [E] = cylinder_energy(a,b,h,m)

mtx = [ 0.5*m*(a^2+b^2) 0 0;
        0 0.5*m*(3*(a^2+b^2)+h^2) 0;
        0 0 0.5*m*(3*(a^2+b^2)+h^2)      ];

E = mtx + m * ([-h/2 0 0]'*[-h/2 0 0]*eye(3) - [-h/2 0 0]*[-h/2 0 0]');


end