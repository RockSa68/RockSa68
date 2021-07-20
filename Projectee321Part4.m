clc;
close all;
clear all;
dt=10^-5
t=0:dt:2e-2;
u=ones(1,2*length(t)-1);
d=[1/dt zeros(1,length(t)-1)];
h=(-1.6939E6).*exp(-6.1241E3.*t)+514267.5.*exp(-271.269.*t).*cosd(-271.269.*t+19.5);
s=conv(h,u);
plot(t,s(1:length(t)));
xlabel('t(seconds)');
title('Step response');