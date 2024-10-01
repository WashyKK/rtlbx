% PROJECT

% 3 DOF project

% From the computed D-H parameters, the robot is defined with three links

L(1) = Link([0, 10, 0, deg2rad(-90), 0]);
L(2) = Link([0, 5, 10, deg2rad(0), 0]);
L(3) = Link([0, 5, 10, deg2rad(0), 0]);

robot = SerialLink(L, 'name', 'washingtons robot');
robot; % Display the robot details

% Plot the robot at all angles = 0 radians
% This is my default robot's position
% robot.plot([0 0 0]); 

T = robot.fkine([pi/3, pi/4, pi/5]);
% robot.plot([pi/3, pi/4, pi/5]);

% The mask option must be specified for under manipulated robots: i.e., robots with less than 6 DOF
IT = robot.ikine(T, 'mask', [1 1 1 0 0 0]);
% robot.plot(IT);

% Robot motion between two orientations in the space
% We need to find out why the below does not accept inverse kinematics
% Use a for loop to iterate over the forward kinematic to get the workspace limits
% T1 = transl(0.4, 0.2, 0) * trotx(pi);
% T2 = transl(0.4, -0.2, 0) * trotx(pi/2);

T1 = robot.fkine([deg2rad(5), deg2rad(30), deg2rad(15)]);
T2 = robot.fkine([deg2rad(70), deg2rad(130), deg2rad(160)]);

% The inverse kinematic of these is given by:
IT1 = robot.ikine(T1, 'mask', [1 1 1 0 0 0]);
IT2 = robot.ikine(T2, 'mask', [1 1 1 0 0 0]);
T1T = robot.fkine([IT1(1), IT1(2), IT1(3)]);

% Time for robot motion
t = [0:0.05:2]';

% Generate the trajectory using linear segments with parabolic blends
q = mtraj(@lspb, IT1, IT2, t);
q1 = jtraj(IT1, IT2, t); % Convenience function that is equivalent to mtraj with tpoly

%To obtain and plot all vectors
[q1, q1d, q1dd] = jtraj(IT1, IT2, t);

[q, qd, qdd] = mtraj(@lspb, IT1, IT2, t);

robot.jtraj(T1, T2, t, 'mask', [1 1 1 0 0 0])
robot.tool = trotx(deg2rad(130));
robot.plot(q)

% What we did above:
% Get the inverse kinematic angles theta 1 2 and 3
% Get T from the forward kinematic
% Plot a path using robot.jtraj with the T corresponding to the answer above
