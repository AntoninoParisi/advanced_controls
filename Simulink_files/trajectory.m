
qi = 0;
qf = pi/3;
dqi = 0;
dqf = 0;
ti = 0;
tf = 10;

[a3 a2 a1 a0] = cubicTrajectory(qi,qf,dqi,dqf,ti,tf);


Ts = 1000;

T = linspace(ti,tf,Ts);
T2 = linspace(ti,2*tf,2*Ts);

pose = a3.*(T-ti).^3+a2.*(T-ti).^2+a1.*(T-ti)+a0; % pos


p_end = pose(end);
p_end = ones(1000,1)*p_end;
pose = [pose p_end'];

pose = [T2' ,pose',pose'*0,pose'*0];
velocity = 3*a3.*(T-ti).^2+2*a2.*(T-ti)+a1; % vel

v_end = velocity(end);
v_end = ones(1000,1)*v_end;
velocity = [velocity v_end'];
velocity = [T2' ,velocity',velocity'*0,velocity'*0];





acceleration = 6*a3.*(T-ti)+2*a2; % acc


a_end = acceleration(end);
a_end = ones(1000,1)*a_end;
acceleration = [acceleration a_end'];

acceleration = [T2' ,acceleration',acceleration'*0,acceleration'*0];








