

function [E] = cube_energy(a,b,c,m)

mtx = [ 1/12*m*(b^2+c^2) 0 0;
        0 1/12*m*(a^2+c^2) 0;
        0 0 1/12*m*(a^2+b^2)      ];

    
% shift inertia to base link

E = mtx + m * ([-a/2 0 0]*[-a/2 0 0]'*eye(3) - [-a/2 0 0]'*[-a/2 0 0]);




end