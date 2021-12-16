robot.dofs = 3;
robot.q0 = [0 0 0];
robot.dq0 = [ 0 0 0];

kp = eye(3)*10;
kd = eye(3)*4;

addpath('./Simulink_files')