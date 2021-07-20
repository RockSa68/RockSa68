% Parameters for tendon model
k1=1; %N/cm 2 for match
k2=3; %N/cm  15 for match
u=1; %N/sec 1 for match
dL=1.2; %velocity of input function for pulse input
dt=1.0; %sec - period of impulse
% initial conditions ++++++++++
x1=2; %cm starting length
x2=6;
L=x1+x2; %cm starting length

% Parameters for muscle model
Fm0=0;
FmStep=2; %Force step to model muscle contraction
Km=.4; %N/cm = .4 N/m
u1=4; %N/sec
StaticLoad=5; %N
g=9.81; %m/sec^2
m=StaticLoad/g;


