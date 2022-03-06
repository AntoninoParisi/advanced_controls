


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

w = eye(6)*5;%diag([  25  100   45     1     1   1]);
z = eye(6)*0.1;%diag([ 0.5  1.5  1.5     0     0   0]);

kp = w^2; % stiff
kd = 2*z*w; % damp


x = [    0.4800
   -0.4386
    0.1500
         0
         0
   -1.0472
]; % custom pose avoiding sing.