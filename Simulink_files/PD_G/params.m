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
kp = eye(3)*50;
kd = eye(3)*4;

addpath('./Simulink_files')