% Goal is to draw a letter E
xf = 50; xb = -xf;  y = 50; zu = 20; zd = 50;
path = [xf y zd; xb y zd; xb y zu; xf y zu; xf y zd] * 1e-3;

plot3(path(:,1), path(:,2), path(:,3), 'color', 'k', 'LineWidth', 2)

p = mstraj(path, [], [0, 3, 0.25, 0.5, 0.25]', path(1,:), 0.01, 0);

Tp = transl(0.1 * p);
Tp = homtrans( transl(0.4, 0, 0), Tp);

L(1) = Link([0, 10, 0, deg2rad(-90), 0]);
L(2) = Link([0, 5, 10, deg2rad(0), 0]);
L(3) = Link([0, 5, 10, deg2rad(0), 0]);

robot = SerialLink(L, 'name', 'washingtons robot');

qcycle = robot.ikine( transl(p), 'mask', [1 1 1 0 0 0] );

robot.plot(qcycle, 'loop')