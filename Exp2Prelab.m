clear all
close all
clc
%EE352_6_1 Simulating RLC circuit
%Step #1 enter the values
R=140.67;
fn=80000;
wn=2*pi*fn;
C1=20e-9;
C2=10e-9;
zeta=1/sqrt(2);
%Step #2 enter the coefficients of the numerator and
%the denominator of the
%Transfer function.
N=[1/(R^2*C1*C2)];
D=[1 2/(R*C1) 1/(R^2*C1*C2)];
%Step #3 use the tf() command to define the transfer function of the system
Sys=tf(N,D);
% Step #4 obtain the step response and bode plot of the system
step(Sys)
grid on;
figure
bode(Sys)
grid on