function limits = envelope (robot)
    x_se1 = robot.fkine([0, 0, 0]);
    x_se2 = robot.fkine([pi, 0, 0]);
    y_se1 = robot.fkine([0, 0, 0]);
    y_se2 = robot.fkine([0, pi, 0]);
    z_se1 = robot.fkine([0, 0, 0]);
    z_se2 = robot.fkine([0, 0, pi]);
    disp(transl(x_se1))
    disp(transl(x_se2))
    limits = [transl(x_se1) transl(x_se2); transl(y_se1) transl(y_se2); transl(z_se1) transl(z_se2)];
end