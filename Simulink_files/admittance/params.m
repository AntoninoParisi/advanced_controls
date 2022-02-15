addpath('../.')

% motion [   x    y    z   phi theta psi]
w = eye(6)*100;%diag([  25  100   45     1     1   1]);
z = eye(6)*10;%diag([ 0.5  1.5  1.5     0     0   0]);

Md =  eye(6)*0.1;
kd = w^2;
kp = 2*z*w;


% compliance  [x y z phi theta psi]
wt =  10* eye(6);
zt = 0.9* eye(6);

Mt  = 0.75*eye(6);
KPt = wt^2;
KDt = 2*zt*wt;


