function [a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams()

a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;

a_c1 = 0.2;
b_c1 = 0.2;
h_c1 = 0.3;

a_cube = 0.2;
b_cube = 0.2;
c_cube = 0.2;

a_c2 = 0.2;
b_c2 = 0.2;
h_c2 = 0.3;


zm1 = [0 0 1];
zm2 = [1 0 1];
zm3 = [0 2 3];

zm = [zm1;zm2;zm3];

g0 = [ 0 0 -9.81]';
kr = 1;
% kri = [0 1/kr 1/kr 1/kr];
kri = [0 0 0 0];

m_c1 = 0.4;
m_c2 = 0.4;
m_cube = 0.4;


% syms m_c1 m_c2 m_cube
m = [0 m_c1 m_cube m_c2]; % mass of motors

r2 = -[a2/2 0 0]';
r3 =  [0 a3/2 0]';
r4 = -[a4/2 0 0]';

r_ic = {r2,r3,r4};

r2 = [a2 0 0]';
r3 = [0 0 a3]';
r4 = [a4 0 0]';

r_ii = {r2,r3,r4};



Im1 = cylinder_energy(a_c1,b_c1,h_c1,m_c1);
Im2 = cube_energy(a_cube,b_cube,c_cube,m_cube);
Im3 = cylinder_energy(a_c2,b_c2,h_c2,m_c2);


end

