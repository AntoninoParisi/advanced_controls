clear
%%
% help show
% help rigidBodyJoint
% help rigidBodyTree
% help rigidBody

% https://it.mathworks.com/help/robotics/ug/rigid-body-tree-robot-model.html#responsive_offcanvas
% https://it.mathworks.com/help/robotics/ref/rigidbodytree.html
% https://it.mathworks.com/help/robotics/ref/rigidbody.html
% https://it.mathworks.com/help/robotics/ref/rigidbodytree.show.html

% robot = importrobot('iiwa14.urdf');

% robot = importrobot('pivot_giunti.urdf');
% robot = importrobot('PRR.urdf');
tmp = fileread('RPR.urdf');
robot = importrobot(tmp);
% robot = importrobot('PPR.urdf');
% robot = importrobot('RRP.urdf');
% robot = importrobot('PRP.urdf');
% robot = importrobot('RRP_2.urdf');

% robot_PRP.DataFormat = 'column';
% config = [0.1, pi/3, -0.15]';

showdetails(robot)


params;

figure;
config = homeConfiguration(robot);
show(robot,config);

config(1).JointPosition = th1;
config(2).JointPosition = dd1;
config(3).JointPosition = th2;


dh;



show(robot,config);



%% robot with matlab joints
clear robot_matlab
robot_matlab = rigidBodyTree;
dh;
params

dh_table = eval(dh_table);



body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute');
jnt1.JointAxis = [ 0 -1 0];
body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','prismatic');
jnt2.JointAxis = [ 0 0 1];
body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3','revolute');
jnt3.JointAxis = [ 0 1 0];
body4 = rigidBody('ee');
jnt4 = rigidBodyJoint('jnt4','fixed');



setFixedTransform(jnt1,dh_table(1,:),'dh');
setFixedTransform(jnt2,dh_table(2,:),'dh');
setFixedTransform(jnt3,dh_table(3,:),'dh');
setFixedTransform(jnt4,dh_table(4,:),'dh');



body1.Joint = jnt1;
body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;

addBody(robot_matlab,body1,'base')
addBody(robot_matlab,body2,'body1')
addBody(robot_matlab,body3,'body2')
addBody(robot_matlab,body4,'body3')


showdetails(robot_matlab)
config_matlab = homeConfiguration(robot_matlab);

config_matlab(1).JointPosition = th1;
config_matlab(2).JointPosition = dd1;
config_matlab(3).JointPosition = th2;






show(robot_matlab,config_matlab);
hold on
show(robot,config);
hold on

% scatter3(pwx,pwy,pwz,2000,'*r')
%%
J = geometricJacobian(robot,config,'Link4');

pl1 = [J(1:3,1)'; 0 0 0; 0 0 0;]';
pl2 = [J(1:3,1:2)' ; 0 0 0]';
pl3 = J(1:3,:);

wl1 = [J(4:6,1)'; 0 0 0; 0 0 0]';
wl2 = [J(4:6,1:2)' ; 0 0 0]';
wl3 = J(4:6,:);
