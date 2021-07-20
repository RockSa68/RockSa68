clear;clc

Duration = 14;
r=1/Duration;

% R_0 = .4; % A single infected person will infect about 2.2 others in a totally susceptible population

N = 1433783686; % Population of  China (2020)
%beta = R_0/(N*Duration); % contact rate
beta = .00000094482;
% Differential equations

%Change me
tspan1 = 0:50; % During quarentine 
y0 = [N-1229,212,1009,8,6]; % Susceptible,Exposed,Infectious, Recovered, Dead 
[t,y]=ode45(@(t,y) SIRD_Fun(t,y,200*beta), tspan1, y0);
% ode45 is a built in Numerical Differential Equations solver in MATLAB.
% There are packages for this solver in other programming languages.

y_2nd = [y(end,1), y(end,2), y(end,3), y(end,4), y(end,5)];
%Change me
tspan2 = 51:100; % days after quarentine 

[t,y2]=ode45(@(t,y) SIRD_Fun(t, y, 100000*beta), tspan2, y_2nd);

y_combined = [y;y2];

plot(0:100,y_combined,'LineWidth', 1.5, 'MarkerSize', 18)
legend('S','E','I','R','D', 'Location', 'Best')
xlabel('Days after March 12, 2020')
ylabel('Population')
title('Predicted Spread of COVID-19 in Russia')
grid on;
grid minor;
set(gca, 'FontSize', 26)

%saveas(gcf, 'corona_120dayPolicy.png')
