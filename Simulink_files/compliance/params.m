addpath('../.')



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
kp = diag([ 250  350  100   50     1   1]);
kd = diag([  35   45   15    1     0   0]);


% addpath('./Simulink_files')