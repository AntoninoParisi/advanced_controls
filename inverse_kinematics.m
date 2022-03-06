
% global file where are setted the values of robot
params;

% T = Tmtx(1,dh_table_s)*Tmtx(2,dh_table_s)*Tmtx(3,dh_table_s)*Tmtx(4,dh_table_s);
% full kinematics from base frame (0) to EE frame (4)
T04 = [cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),                  (2*cos(t1))/5 + (4*cos(t1)*cos(t2))/25;
                         sin(t2),          cos(t2),        0,                    (4*sin(t2))/25 - d1 - 3/10;
                 cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), (2*sin(t1))/5 + (4*cos(t2)*sin(t1))/25 + 3/20;
                               0,                0,        0,                                             1];

            
                           
                           
%% theta 2

pwx = (T04(1,4));
pwy = (T04(2,4));
pwz = (T04(3,4));


% alpha = sin(t1)*a1*a4 + a2*a4;
% beta = a3*a4 + a4*d1;
% gamma = a1^2 + 2*sin(t1)*a1*a2 + a2^2 + a3^2 +2*a3*d1 + a4^2 + d1^2 - (pwx^2+pwy^2+pwz^2);
% 
% 
% 
% theta2_1 = (-4*beta + sqrt((4*beta)^2 - 4 * (2*alpha - gamma) * (-(2*alpha + gamma ))) )/ (2*(2*alpha - gamma));
% theta2_2 = (-4*beta - sqrt((4*beta)^2 - 4 * (2*alpha - gamma) * (-(2*alpha + gamma ))) )/ (2*(2*alpha - gamma));
% 
% 
% theta2_1 = atan(theta2_1)*2;
% theta2_2 = atan(theta2_2)*2;

c2 = (sqrt(pwx^2+(pwz-a1)^2) - a2) / a4;


s2 = sqrt(1-c2^2);

theta2_1 = atan2(s2,c2);
theta2_2 = atan2(-s2,c2);


%% d1

prismatic_1 = (4*sin(theta2_1))/25 - 3/10 - pwy;
prismatic_2 = (4*sin(theta2_2))/25 - 3/10 - pwy;

%%  theta 1
s1 = -(a4^2*cos(theta2)^2 + a1^2 + a2^2 +  + 2*a2*a4*cos(theta2) - pwx^2 - pwz^2)/(2*a1*a2 + 2*a1*a4*cos(theta2));
c1 = sqrt(1-s1^2);
theta1_1 = atan2(s1,c1);
theta1_2 = atan2(s1,-c1);







%% displaying results

% considering all possible configuration from the IK

disp('Theta 1 vs IK theta 1 : ')
disp(t1);
disp(theta1_1);
disp(theta1_2);
disp('d1 vs IK d1 : ')
disp(d1);
disp(prismatic_1);
disp(prismatic_2);
disp('Theta 2 vs IK theta 2 : ')
disp(t2);
disp(theta2_1);
disp(theta2_2);




