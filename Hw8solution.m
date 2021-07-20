clc
clear all
close all
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
a=7
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