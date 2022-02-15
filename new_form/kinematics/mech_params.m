function params = mech_params()

params.a1 = 0.15;
params.a2 = 0.4;
params.a3 = 0.3;
params.a4 = 0.16;

params.a_c1 = 0.2;
params.b_c1 = 0.2;
params.h_c1 = 0.3;

params.a_cube = 0.2;
params.b_cube = 0.2;
params.c_cube = 0.2;

params.a_c2 = 0.2;
params.b_c2 = 0.2;
params.h_c2 = 0.3;


zm1 = [0 0 1];
zm2 = [1 0 1];
zm3 = [0 2 3];

params.zm = [zm1;zm2;zm3];

params.g0 = [ 0 0 -9.81]';
params.kr = 1;
% kri = [0 1/kr 1/kr 1/kr];
params.kri = [0 0 0 0];

params.m_c1 = 0.4;
params.m_c2 = 0.4;
params.m_cube = 0.4;

params.m = [0 0.4 0.4 0.4]; % mass of motors

r2 = -[params.a2/2 0 0]';
r3 = -[0 params.a3/2 0]';
r4 = -[params.a4/2 0 0]';

params.r_ic = {r2,r3,r4};

r2 = [params.a2 0 0]';
r3 = [0 0 params.a3]';
r4 = [params.a4 0 0]';

params.r_ii = {r2,r3,r4};



params.Im1 = cylinder_energy(params.a_c1,params.b_c1,params.h_c1,params.m_c1);
params.Im2 = cube_energy(params.a_cube,params.b_cube,params.c_cube,params.m_cube);
params.Im3 = cylinder_energy(params.a_c2,params.b_c2,params.h_c2,params.m_c2);
end