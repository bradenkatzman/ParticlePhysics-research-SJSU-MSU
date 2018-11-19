% Calculate and plot the time variation of x and y in the following
% differential equations

% Cubic Autocatalor Reaction (a problem in the class of cyclic variations)
% 1) dxdt = 0.6-x*y^2 - 0.1*x
% 2) dydt = x*y^2 - y + 0.1*x
%
% x(0) = 1, y(0) = 1
%
% x(t), y(t) represent the concetrations of two reacting chemicals
%   They specify how quickly each concentration varies, given the
%   concentration values
%
% Goal: Predict how the concetrations fluctuate with time

% We need to define a function that will calcualte values for both dx/dt
% and dy/dt given values of x,y, and time
%   We will treat each equation as a component of a vector
% d/dt [x; y] = [dxdt; dydt]
% OR dw/dt = f(t, w) --> w is a column vector w = [x; y]

% equation to compute dw/dt given w
function dwdt
    % set up time range
    start_time = 0;
    end_time = 100;
    time_range = [start_time end_time];
    
    % initial values
    x0 = 1;
    y0 = 1;
    initial_w = [x0; y0];
    
    % in this case, sol_values is a matrix
    % sol_values = [x(t1) y(t1)]
    %              [x(t2) y(t2)]
    %               ...........
    % Each row in the matrix corresponds to the sol. at a particular time
    % Each column in the matrix corresponds to a different component for
    % the vector valued solution
    [t_values, sol_values] = ode45(@(t,w) diff_eq(t,w), time_range, initial_w);
    
    plot(t_values, sol_values);
    
    % plot only x as a function of time
    plot(t_values, sol_values(:, 1));
    
    % plot only y as a function of time
    plot(t_values, sol_values(:, 2));
end

% define the ODE (defined by two ODEs)
function dw_vectordt = diff_eq(t,w_vector)
    x = w_vector(1); % the firt value in w_vector is the x value
    y = w_vector(2); % the second_value in w_vector is the y value
    
    % solve the equations
    dxdt = diff_eqDXDT(x,y);
    dydt = diff_eqDYDT(x,y);
    
    dw_vectordt = [dxdt; dydt];
end

function dxdt = diff_eqDXDT(x,y)
    dxdt = 0.6 - x*y^2 - 0.1*x;
end

function dydt = diff_eqDYDT(x,y)
    dydt = x*y^2 - y + 0.1*x;
end
