%EE352_6_1 Simulating RLC circuit
%Step #1 enter the values
R=50;
L=0.01;
fn=2000;
wn=2*pi*fn;
C=1/(L*wn*wn)
zeta=R/(2*wn*L)
%Step #2 enter the coefficients of the numerator and
%the denominator of the
%Transfer function.
N=[1 0 0];
D=[1 R/L 1/(L*C)];
%Step #3 use the tf() command to define the transfer function of the system
Sys=tf(N,D);
% Step #4 obtain the step response and bode plot of the system
step(Sys)
grid on;
figure
bode(Sys)
grid on