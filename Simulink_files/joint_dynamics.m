function [sys,x0,str,ts] = joint_dynamics(t,x,u,flag,robot)
%CSFUNC An example MATLAB file S-function for defining a continuous system.  
%   Example MATLAB file S-function implementing continuous equations: 
%      x' = Ax + Bu
%      y  = Cx + Du
%   
%   See sfuntmpl.m for a general S-function template.
%
%   See also SFUNTMPL.
  
%   Copyright 1990-2009 The MathWorks, Inc.


% A=[-0.09   -0.01
%     1          0];
% 
% B=[ 1   -7
%     0   -2];
% 
% C=[ 0    2
%     1   -5];
% 
% D=[-3    0
%     1    0];

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(robot);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u,robot);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u,robot);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes(robot)

sizes = simsizes;
sizes.NumContStates  = 2*robot.dofs;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2*robot.dofs;
sizes.NumInputs      = robot.dofs;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0  = [robot.q0,robot.dq0];
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u,robot)
n = robot.dofs;
q = x(1:n);
dq = x(n+1:2*n);

sys(1:n) = dq;

B = B_Lagrangian(q);
C = C_Lagrangian(q,dq);
G = G_Lagrangian(q);



sys(n+1:2*n) = B \ (u - C*dq - G);%-pinv(B)*((C*dq + G)-u);









% end mdlDerivatives
%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u,robot)

sys = x;

% end mdlOutputs
