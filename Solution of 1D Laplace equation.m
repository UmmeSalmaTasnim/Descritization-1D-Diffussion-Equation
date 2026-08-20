clear
close all
clc

%% Define the mesh
n_points = 5;
domain_size = 1;

h = domain_size/(n_points - 1);

%% Initialize the problem
y = zeros(1,n_points);
y_new = zeros(1,n_points);

y(1) = 0;
y(n_points) = 1;

y_new(1) = 0;
y_new(n_points) = 1;

error_mag = 1;
error_req = 1e-7;

iterations = 0;

% Pre-allocate error history
max_iterations = 10000;
error_history = zeros(1,max_iterations);

%% Jacobi calculations
while error_mag > error_req

    % Jacobi iteration
    for i = 2:(n_points-1)
        y_new(i) = 0.5*(y(i-1) + y(i+1));
    end

    % Calculate error
    error_mag = 0;

    for i = 2:(n_points-1)
        error_mag = error_mag + abs(y(i) - y_new(i));
    end

    % Count iteration
    iterations = iterations + 1;

    % Store error
    error_history(iterations) = error_mag;

    % Update solution
    y = y_new;

end

% Remove unused elements
error_history = error_history(1:iterations);

%% Display result
fprintf('Number of iterations = %d\n',iterations);
fprintf('Final error = %.10e\n',error_mag);

disp('Numerical solution:')
disp(y)
%% Numerical solution plot
x_dom = (0:n_points-1)*h;

figure

plot(x_dom,y,'r-o','LineWidth',1.5)

xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
title('Numerical Solution','FontSize',16)

xticks(x_dom)
yticks(y)

grid on

%% Convergence plot

figure

semilogy(1:iterations, error_history, 'r-o', ...
    'LineWidth', 1, 'MarkerSize', 5)

hold on

tol_line = yline(error_req, 'k--', 'LineWidth', 1.5);

% Add tolerance label
tol_line.Label = 'Tolerance = 10^{-7}';
tol_line.LabelVerticalAlignment = 'bottom';
tol_line.LabelHorizontalAlignment = 'right';

xlabel('Iteration Number')
ylabel('Error Magnitude')
title('Convergence of Jacobi Method')

legend('Error', 'Convergence Tolerance', ...
    'Location', 'northeast')

grid on
hold off
%% Comparison with exact solution

x = 0:h:domain_size;

% Exact solution
y_exact = x;

figure

plot(x, y_exact, 'k--', 'LineWidth', 1.8)
hold on

plot(x, y, 'ro-', 'LineWidth', 1, 'MarkerSize', 5)

xlabel('x')
ylabel('y')
title('Exact Solution vs Jacobi Numerical Solution')

legend('Exact Solution', 'Jacobi Numerical Solution', ...
    'Location', 'northwest')

grid on
hold off

%% Calculate error

absolute_error = abs(y_exact - y);

fprintf('\nComparison of solutions:\n')
fprintf('       x       Y_Exact   Y_Numerical        Error\n')

for i = 1:n_points
    fprintf('%8.2f    %10.6f    %10.6f        %10.6e\n', ...
        x(i), y_exact(i), y(i), absolute_error(i));
end

fprintf('\nMaximum absolute error = %.10e\n', max(absolute_error));