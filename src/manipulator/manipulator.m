clear; clc;
% PROJECT

% 3 DOF project

% From the computed D-H parameters, the robot is defined with three links

L(1) = Link([0, 10, 0, deg2rad(-90), 0]);
L(2) = Link([0, 0.5, 10, deg2rad(0), 0]);
L(3) = Link([0, 0.5, 10, deg2rad(0), 0]);

wkk_robot = SerialLink(L, 'name', 'washingtons robot');
wkk_robot; % Display the robot details

% Plot the robot at all angles = 0 radians
% This is my default robot's position
% robot.plot([0 0 0]); 

home_position = [0, -1*pi/2, 0];

% The mask option must be specified for under manipulated robots: i.e., robots with less than 6 DOF
% T = robot.fkine([pi/3, pi/4, pi/5]);
% IT = robot.ikine(T, 'mask', [1 1 1 0 0 0]);
% wkk_robot.plot(IT);

% Robot motion between two orientations in the space
% I need to find out why the below does not accept inverse kinematics
% Use a for loop to iterate over the forward kinematic to get the workspace limits
% T1 = transl(0.4, 0.2, 0) * trotx(pi);
% T21 = transl(-20, -2, 10) * trotx(pi/2); -> Does not  work because the robot is very under manipulated

T1 = wkk_robot.fkine(home_position);
T2 = wkk_robot.fkine([deg2rad(20), deg2rad(-10), deg2rad(18)]);
T3 = wkk_robot.fkine([deg2rad(-180), deg2rad(-180), deg2rad(180)]);
T4 = wkk_robot.fkine([deg2rad(240), deg2rad(120), deg2rad(290)]);

% The inverse kinematic of these is given by:
IT1 = wkk_robot.ikine(T1, 'mask', [1 1 1 0 0 0]);
IT2 = wkk_robot.ikine(T2, 'mask', [1 1 1 0 0 0]);
IT3 = wkk_robot.ikine(T3, 'mask', [1 1 1 0 0 0]);
IT4 = wkk_robot.ikine(T4, 'mask', [1 1 1 0 0 0]);

% Time for robot motion
t = [0:0.05:2]';

% Generate the trajectory using linear segments with parabolic blends
q = mtraj(@lspb, IT3, IT4, t);
q1 = jtraj(IT2, IT4, t); % Convenience function that is equivalent to mtraj with tpoly -> A higher order polynomial (Order 5)

wkk_robot.plot(q, 'loop', 'trail', 'r');
title('Robot Motion');

% What we did above:
% Get the inverse kinematic angles theta 1 2 and 3
% Get T from the forward kinematic
% Plot a path using robot.jtraj with the T corresponding to the answer above
