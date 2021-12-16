robot.dofs = 1;
robot.lambda_mtx = eye(1); % positive definite matrix
robot.kp = 10000;
robot.kd = 3000;
robot.q0 = [0];
robot.dq0 = [0];
K_th = eye(1)*1.1;



%% trajectory

robot.q = 1;
robot.dq = 1;
robot.ddq = 1;
