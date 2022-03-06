robot.dofs = 1;
robot.lambda_mtx = 1; % positive definite matrix
robot.kp = 10;
robot.kd = 3;
robot.q0 = [0];
robot.dq0 = [0];
K_th = eye(3); %% 3x3

%% trajectory

robot.q = 1;
robot.dq = 1;
robot.ddq = 1;
