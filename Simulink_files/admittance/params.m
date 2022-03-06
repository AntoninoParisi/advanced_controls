
kp = eye(6)*200;
kd = eye(6)*35;


wt =  10* eye(6);
zt = 0.95* eye(6);

Mt  = 0.075*eye(6);
KPt = wt^2;
KDt = 2*zt*wt;


x = [ 0.5357
   -0.2527
    0.2868
         0
   -0.2500
    0.3000]; % custom pose avoiding sing.


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