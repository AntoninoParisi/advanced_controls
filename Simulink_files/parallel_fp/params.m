addpath('../.')

% dynamics of the ee. pose for a given "force error reference pose"
%            [x y z]
w =   20*diag([1 1 1]);
z = 1.5*diag([1 1 1]);

Md = 0.4*diag([1 1 1]);
kp = w^2;
kd = 2*z*w;

% compliance between "force error reference pose" and force error
PI_ctrl = 1;
k_fp = 0.5*eye(3);
k_fi = 1.5*eye(3);


