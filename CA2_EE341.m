clc
clear all
close all
%MATLAB Program for Chebyshev type 1 filter design on HW8
%This program designs a Chebyshev filter with
%0.1 dB passband edge, 50 dB stopband attenuation,
%passband edge 20000Hz, and stopband edge 24000Hz
clf
format short e
pedge = 0.1;
satten = 50;
fp = 20000;
fs = 24000;
eps = sqrt(10^(pedge/10) - 1)
d2 = 10^-(satten/20) %stopband attenuation factor
Nr = acosh(sqrt(1/d2^2 - 1)/eps)/acosh(fs/fp) %Unrounded N
N = ceil(Nr)
wp = 2*pi*fp; %passband edge in rad/sec
k = (0:N-1)';
beta = ((sqrt(1 + eps^2) + 1)/eps)^(1/N)
r1 = wp*(beta^2 + 1)/(2*beta)
r2 = wp*(beta^2 - 1)/(2*beta)
phi = pi/2 + (2*k+1)*pi/(2*N)
p = r2*cos(phi) + j*r1*sin(phi) %poles
figure(1)
polar(angle(p),abs(p),'X'); %plot the poles
title('Poles of 14th Order Chebyshev Filter for HW8');
%Part 1A
Prod=prod(p,'all')
Ho=1/sqrt(1+eps^2)
K=Ho*Prod
%Part 1B
den = real(poly(p)); % p is your vector of N poles from HW8.
%den is the transfer function denominator.
num = real(K); %This is the value of K you choose in part a.
%num is transfer function numerator.
figure (2)
P = bodeoptions; %Set bodeplot options
P.FreqUnits = 'Hz';
P.FreqScale = 'linear';
P.XLim = {[10 25000]}; %Plot from 10Hz to 25KHz
bodeplot(tf(num,den),P); %bodeplot makes magnitude and phase plots.
grid; %Add a grid to your plot.



%Part 2A
K1=1/(2*pi*60)^2;
%Part 2B
num = K1*real(poly([-i*2*pi*60 i*2*pi*60])); %K1 is value found in part (a)
%num is numerator of transfer function
den = 1; %denominator of transfer function.
figure (3)
P = bodeoptions; %Set bodeplot options
P.FreqUnits = 'Hz';
P.FreqScale = 'linear';
P.XLim = {[10 80]}; %Plot from 10Hz to 80Hz
bodeplot(tf(num,den),P); %bodeplot makes magnitude and phase plots.
grid; %Add a grid to your plot.
%Part 2C
a=11
K2=((a^2)+(2*pi*60)^2)/((2*pi*60)^2);
%Part 2D
f=(1:.1:55);
s=i*2*pi*f
Hs=(K2*(s-i*2*pi*60).*(s+i*2*pi*60));
Hf=Hs./((s+a-i*2*pi*60).*(s+a+i*2*pi*60));
Ht=abs(Hf);
figure (4)
plot(f,20*log10(Ht))
f1=(65:.1:100);
s1=i*2*pi*f1
Hs1=(K2*(s1-i*2*pi*60).*(s1+i*2*pi*60));
Hf1=Hs1./((s1+a-i*2*pi*60).*(s1+a+i*2*pi*60));
Ht1=abs(Hf1);
figure (5)
plot(f1,20*log10(Ht1))
figure (6) 
num1 = K2*real(poly([-i*2*pi*60 i*2*pi*60])); %K2 is value found in part (a)
%num1 is numerator of transfer function
den1 = real(poly([a-i*2*pi*60 a+i*2*pi*60])); %denominator of transfer function.
P1 = bodeoptions; %Set bodeplot options
P1.FreqUnits = 'Hz';
P1.FreqScale = 'linear';
P1.XLim = {[1 100]}; %Plot from 10Hz to 80Hz
bodeplot(tf(num1,den1),P1)