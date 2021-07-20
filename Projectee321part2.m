clc;
close all;
clear all;
syms s x t
s=tf('s');
R1=50;
R2=50;
L1=6*10^-3;
L2=10*10^-3;
C1=9.62*10^-6;
num=(s^3*(R2*L1*L2*C1)+s^2*(R1*R2*L2*C1)+s*(R2*L1)+R1*R2);
xm=(R1*L1*L2*C1+R2*L1*L2*C1);
y=(R1*R2*L1*C1+R1*R2*L2*C1);
z=(R1*L1+R2*L1);
z1=R1*R2;
den=(s^3*xm+s^2*y+s*z+z1);
sys1=num/den
[Z,P,G]=zpkdata(sys1);
disp('The location of zeros are');
Z{1,1}
disp('The location of poles are');
P{1,1}
subplot(2,1,1)
impulse(sys1)
grid on;
subplot(2,1,2)
step(sys1)
grid on;
num1=(x^3*(R2*L1*L2*C1)+x^2*(R1*R2*L2*C1)+x*(R2*L1)+R1*R2);
x1=(R1*L1*L2*C1+R2*L1*L2*C1);
y=(R1*R2*L1*C1+R1*R2*L2*C1);
z=(R1*L1+R2*L1);
z1=R1*R2;
den1=(x^3*x1+x^2*y+x*z+z1);
sys2=num1/den1;
impulse_response=ilaplace(sys2, x, t)
sys3=num1/(den1*x);
step_response=ilaplace(sys3, x, t)
figure
bode(sys1)
grid on
% num=(s^3*(b3)+s^2*(b2)+s*(b1)+b0);
% a3=1;
% a2=(R^2)/(2*R);
% a1=1/(L2*C);
% a0=(R^2)/(L1*L2*C*(2*R));
% den=(s^3*(a3)+s^2*(a2)+s*(a1)+a0);
% sys1=num/den;
% [Z,P,K]=zpkdata(sys1);
% disp('The location of zeros are');
% Z{1,1}
% disp('The location of poles are');
% P{1,1}
% subplot(2,1,1)
% impulse(sys1)
% grid on;
% subplot(2,1,2)
% step(sys1)
% grid on;
% num1=(x^3*(b3)+x^2*(b2)+x*(b1)+b0);
% den1=(x^3*a3+x^2*a2+x*a1+a0);
% sys2=num1/den1;
% impulse_response=ilaplace(sys2, x, t)
% sys3=num1/(den1*x);
% step_response=ilaplace(sys3, x, t)
% figure
% bode(sys1)
% grid on