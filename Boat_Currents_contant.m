clear; close all; clc

%% Boat - Constant Currents

% Boundary Conditions & Initial Parameters

v_boat = 15; % ml/h
currents = [2; -6]; % ml/hr
t_0 = 0; 
pos_i = [-20; 0]; % ml
pos_f = [-15; 35.5]; % ml

% Solve system of equations

syms C1 C2 tf

% System of equations to be solved for optimal solution

eq1 = (v_boat*cos(atan2(C2,C1)) + currents(1))*tf + pos_i(1) == pos_f(1);
eq2 = (v_boat*sin(atan2(C2,C1)) + currents(2))*tf + pos_i(2) == pos_f(2);
eq3 = (v_boat*sin(atan2(C2,C1)) + currents(2))*(pos_f(1) - pos_i(1)) == ...
    (v_boat*cos(atan2(C2,C1)) + currents(1))*(pos_f(2) - pos_i(2));

[C1_sol, C2_sol, tf_sol] = solve([eq1, eq2, eq3], [C1 C2 tf]);

C1_sol = double(C1_sol);
C2_sol = double(C2_sol);
tf_sol = double(tf_sol);

% Optimal Control Solution

theta = atan2(C2_sol,C1_sol);
theta_deg = rad2deg(theta);

% Plot components vs time

t = 0:0.01:ceil(tf_sol);
x1_t = (v_boat*cos(theta) + currents(1))*t + pos_i(1);
x2_t = (v_boat*sin(theta) + currents(2))*t + pos_i(2);

subplot(2,1,1)
plot(t,x1_t)
ylabel('x1')
xlabel('Time')
title('x1(t) time evolution')
grid on

subplot(2,1,2)
plot(t,x2_t)
ylabel('x2')
xlabel('Time')
title('x2(t) time evolution')
grid on

% Plot optimal path

figure;
plot(x1_t, x2_t, 'Color', 'r', 'LineWidth', 1.5)
hold on;

% Plot the currents vector field

resolution = 15;
x1_vals = linspace(pos_i(1), pos_f(1), resolution);
x2_vals = linspace(pos_i(2), pos_f(2), resolution);
[x_1, x_2] = meshgrid(x1_vals, x2_vals);
quiver(x_1, x_2, currents(1)*ones(size(x_1)), currents(2)*ones(size(x_2)), ...
    'Color', 'b', 'LineWidth', 0.5, 'AutoScale', 'on', 'AutoScaleFactor', 0.3);
hold on;

% Start & End points

scatter(pos_i(1), pos_i(2), 'filled', 'MarkerEdgeColor', [0.4660 0.6740 0.1880], ...
        'MarkerFaceColor', [0.4660 0.6740 0.1880], 'SizeData', 60); % Start (green)
scatter(pos_f(1), pos_f(2), 'filled', 'MarkerEdgeColor', [0.9290 0.6940 0.1250], ...
        'MarkerFaceColor', [0.9290 0.6940 0.1250], 'SizeData', 60); % End (orange)

ylabel('x2')
xlabel('x1')
title('Optimal path & Currents field')
grid on

