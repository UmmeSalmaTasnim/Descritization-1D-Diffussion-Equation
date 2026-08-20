clear 
close all
clc

%% define the mesh
n_points = 5;
domain_size = 1;
h = domain_size/(n_points -1);
%% Initializing the problem
y(1) = 0;
y(n_points) = 1;

y_new(1) = 0;
y_new(n_points) = 1;

error_mag = 1;
error_req = 1e-7;
iterations = 0;
%% Calculations
while error_mag > error_req
    for i=2:(n_points -1)
          y_new(i)= 0.5 * (y(i-1)+ y(i+1));
          iterations = iterations + 1;
     end
     % Calculations of error magnitude
     error_mag = 0;
     for i=2:(n_points -1)
           error_mag = error_mag + abs(y(i)- y_new(i));
     end
     % assigning the new to be old
     y = y_new;
     
end
%% plotting
x_dom = ((1:n_points)-1)*h;
figure;
plot(x_dom, y, 'r-o')          % plot
xlabel('x', 'FontSize', 14)                     % label with unit and size
ylabel('y', 'FontSize', 14)
title('Numerical solution', 'FontSize', 16)          % axis tick label size
xticks(0:0.25:1)                                    % set tick locations if desired
xticklabels({'0','0.25','0.5','0.75','1'})
yticks(y)
grid on
