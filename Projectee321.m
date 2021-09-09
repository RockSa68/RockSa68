clc;
close all;
clear all;
R=50;
L1=.006;
L2=.01;
C=9.62*10^-6;
beta=(2/R);
alpha=beta*L2;

A=[-1/(L1*beta) 1/(L1*beta) 0; 1/alpha -1/alpha (-1/L2); 0 1/C 0];
B=[(1/L1)*(1-(1/(beta*R))); 1/(alpha*R); 0];
C=[1/beta (-1/beta) 0];
D=(1/R);
sys= ss(A,B,C,D);
figure();impulse(sys);
figure();step(sys);
figure();bode(sys);
Tf=tf(sys);
poles=roots(Tf.den{1,1})
zeros=roots(Tf.den{1,1})