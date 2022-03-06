robot.dofs = 3;
robot.q0 = [0 0 0];
robot.dq0 = [ 0 0 0];
syms a1 a2 a3 a4 t1 t2 d1 real
robot.dh = [
    0,pi/2,a1,0;
    a2,0,0,t1;
    0,-pi/2,a3+d1,0;
    a4,0,0,t2
];
w = diag([   200   200   200    10   10     10]);
z = diag([ 0.95 0.95 0.95  0.95 0.95 0.95]);


kp = w^2;
kd = 2*z*w;
trajectory;

% addpath('./Simulink_files')

