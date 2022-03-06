
%        [   x    y    z  phi theta psi]
w = eye(6)*10;%diag([  25  100   45     1     1   1]);
z = eye(6)*1;%diag([ 0.5  1.5  1.5     0     0   0]);

Md =  eye(6);
kp = w^2; % stiff
kd = 2*z*w; % damp

% kp = eye(6)*10000;
% kd = eye(6)*2000;



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

x = [ 0.5357
   -0.2527
    0.2868
         0
   -0.2500
    0.3000]; % custom pose avoiding sing.