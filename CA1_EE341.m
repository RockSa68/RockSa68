clear all;
clc;
close all;
%whole
syms n t;
T = 1;
w0 = 2*pi/T;
x = piecewise(t<=T/2,1,0);
cn = int(x*exp(-1i*w0*t*n),t,0,T)/T;

t_range = 0:0.001:2;
N_val = [3 10 30];
for i = 1:length(N_val)
    x_cycle = 0;
    for j = -N_val(i):N_val(i)
        x_cycle = x_cycle + limit(cn,n,j)*exp(1i*j*w0*t);
    end
    plot(t_range,subs(x_cycle,t,t_range));
    hold on;
end
figure (1)
title("Truncated Fourier Series Plot for Fullwave");
xlabel("t")
legend("N = 3","N = 10","N = 30");
% Where are the significant approximation errors?
%Answer: The significant approximation errors occur near the
%discontinuities. The discontinuities are at t=0 and t=(n*To)/2 where n is
%the increments of t. the discontinuituis also represent the left-hand and
%right-hand derivatives that are not equal to the rest of the t values
%during convergence. 
%Are there any unusual "Phenomena"?
%Answer: The phenomena used is the Gibbs phenomena which causes the ripples
%in the waveform seires to become narrower as the number of terms used
%becomes larger. The amplitude approached 9% of the height of the
%dicontinuity.

%Half
syms n t;
T = 1;
w0 = 2*pi/T;
x = piecewise(t<=T/2,sin(w0*t),0);
cn = int(x*exp(-1i*w0*t*n),t,0,T)/T;
figure(2)
t_range = 0:0.001:2;
N_val = [3 10 30];
for i = 1:length(N_val)
    x_cycle = 0;
    for j = -N_val(i):N_val(i)
        x_cycle = x_cycle + limit(cn,n,j)*exp(1i*j*w0*t);
    end
    plot(t_range,subs(x_cycle,t,t_range));
    hold on;
end
title("Truncated Fourier Series Plot for Half-wave");
xlabel("t")
legend("N = 3","N = 10","N = 30");
% Is this waveform better or worse approximation than the square wave, for
% a given value of N?
%Answer: The half-wave rectifier is worse becuase it has more ripples and
% has a lower DC output voltage than the full-wave. 