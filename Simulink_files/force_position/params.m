addpath('../.')

% dynamics of the ee. pose for a given "force error reference pose"
%            [x y z]
w =   50*diag([1 1 1]);
z = 1.5*diag([1 1 1]);

Md = 0.75*diag([1 1 1]);
KP = w^2;
KD = 2*z*w;

% compliance between "force error reference pose" and force error
PI_ctrl = 1;
KFP = 0.5*eye(3);
KFI = 1.5*eye(3);




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