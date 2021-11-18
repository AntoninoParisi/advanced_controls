%% evaluation of T
params;

[J,pl1,pl2,pl3,wl1,wl2,wl3] = jacobian(th1,dd1,th2);
B = BMtx(J);

T = 0.5 * qd * B * qd';




%% potential energy



pot1 = -m_c1 * g0 * pl1;

pot2 = -m_cube * g0 * pl2;

pot3 = eval(-m_c2 * g0 * pl3);





U = eval(pot1 + pot2 + pot3);



%% display potential and kinetic energy

disp('potential energy : ')
disp(U)
disp('kinetic energy : ')
disp(T)

