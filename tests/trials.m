% MATLAB Robotics Toolbox by Peter Corke

% Create a translation [ 4 x 4 matrix ]

T = transl(1,2,3);

% Display it in a human readable form, i.e., translations and rotations separately.
trprint(T);

M = SE3(4,5,6); % Create an SE3 object. This is similar to what transl does
trprint(M);

double(M);
M.T %The equivalent 4x4 matrix of M

T = SE3(1,2,3); % create a pure translation SE3 object
T2 = T*T; % the result is an SE3 object

T3 = trinterp(T, T2,5); % Creates an interpolation from points T to T2. Containing 5 steps. You get 5 transformations.
T3(6)

% plot_vehicle function creates a 2D plot containing a vehicle to be controlled.
% the block library for use is opened by the command roblocks
