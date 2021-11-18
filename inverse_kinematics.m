params;

T02 = [cos(t1), -sin(t1),  0,      a2*cos(t1);
       0,        0, -1,               0;
 sin(t1),  cos(t1),  0, a1 + a2*sin(t1);
       0,        0,  0,               1]; % from base to end of link of joint 1

   
T03 = [cos(t1), 0, -sin(t1),      a2*cos(t1);
       0, 1,        0,       - a3 - d1;
 sin(t1), 0,  cos(t1), a1 + a2*sin(t1);
       0, 0,        0,               1];




T04 = [cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),        (2*cos(t1))/5 + (4*cos(t1)*cos(t2))/25;
                         sin(t2),          cos(t2),        0,                    (4*sin(t2))/25 - d1 - 3/10;
                 cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), (2*sin(t1))/5 + (4*cos(t2)*sin(t1))/25 + 3/20;
                               0,                0,        0,                                             1];

                           
                           

%%  theta 1

if(isa(T03,'sym'))
ET03 = eval(T03);
else
ET03 = T03;
end
x = ET03(1,4);
z = ET03(3,4);

s1 = (x^2+z^2-a1^2-a2^2)/(2*a1*a2);
c1 = sqrt(1-s1^2);
theta1 = atan2(s1,c1);


%% d1


if(isa(T04,'sym'))
ET04 = eval(T04);
else
ET04 = T04;
end
x = ET04(1,4);
y = ET04(3,4);


syms D
d12 = solve( D^2 + 2*D*a3 - (x^2+y^2-a2^2*cos(theta1)^2+a3^2))

d1 = d12(2)

%% theta 2

pwx = (T04(1,4));
pwy = (T04(2,4));


%t2 = pi/3;
params
syms t2
pwx = (T04(1,4));
pwy = (T04(2,4));
pwz = (T04(3,4));


sys = a4^2*cos(t2)^2+2*a1*cos(t2)*(a2+a4*sin(t1)) - (pwx^2+pwz^2-a1^2-a2^2-2*a1*a2*sin(t1));

sol = solve(sys);
theta2 = sol(2);
eval(theta2)





