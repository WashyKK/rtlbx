%% 6 DOF Example

% 6DOF to illustrate all maneuvrability

L(1) = Link([0, 0, 0, pi/2, 0]);
L(2) = Link([0, 0, 0.5, deg2rad(0), 0]);
L(3) = Link([0, 0.15, 0.02, -1*pi/2, 0]);
L(4) = Link([0, 0.5, 0, pi/2, 0]);
L(5) = Link([0, 0, 0, -1*pi/2, 0]);
L(6) = Link([0, 0, 0, 0, 0]);

robot = SerialLink(L, 'name', 'wkk');
robot % Display the robot details
% Hold all plots here
figure;

home_position = [0, -1*pi/2, 0, -1*pi/2, pi/2, pi/2];
% subplot(2,2,1);
%robot.plot(home_position);
T = robot.fkine([pi, pi/4, 0, -1*pi/7, pi/13, 2*pi])
IT1 = robot.ikine6s(T);
robot.plot(IT1)