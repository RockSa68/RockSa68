clear;
% Step #1 Enter the actual components values;
R1= 10000; Ro=1000000; L1=0.18; L2=0.19; M=0.04677; RL1=160; RL2=170;
f=400;
k=M/sqrt(L1*L2);
% Step #2 obtain A, B, C, D matrices
% These matrices assume that the dots are on same side of L1 and L2
% If dots on opposite sides than replace M with –M in the A and B matrices
Den=(L1*L2-M*M); % this is the common denominator
A=[-L2*(R1+RL1) M*(Ro+RL2); M*(R1+RL1) -L1*(Ro+RL2)]/Den; % A matrix
B=[L2; -M]/Den; % B matrix
C=[0 -Ro]; % C Matrix
D=[0]; % D Matrix
% Step #3 Entering the state space model
SYS = ss(A,B,C,D);
% Step #4 define the 400 Hz triangular pulse for two periods
u1= 0.001:0.001:1; %up
u2=1-(0.001:0.001:1-0.001); %down
u1p=[0 u1 u2 0 -u1 -u2]*5; %u1p is one period
u = [u1p u1p 0]; %u has two periods
l=length(u)-1;
time=2*(0:l)/(l*f); % time period is (2/400) seconds.
% Step #5 simulate the triangular pulse at 400 Hz
[y1,t1,x1]=lsim(SYS,u,time); % y is the output, t is the time, x is the states
subplot(2,2,1)
plot(t1,u);
xlabel('time');ylabel('u(t)');grid on;
subplot(2,2,2)
plot(t1,y1);
xlabel('time');ylabel('V2');grid on;
subplot(2,2,3)
plot(t1,x1(:,1));
xlabel('time');ylabel('I1(t)');grid on;
subplot(2,2,4)
plot(t1,x1(:,2));
xlabel('time');ylabel('I2(t)');grid on;
% Step #6 simulate the sine wave at 400 Hz for four periods
time=(0:0.001:1)/100;
u3=5*sin(800*pi*time);
[y2,t2,x2]=lsim(SYS,u3,time); % y is the output, t is the time, x is the states
figure % display new graph
subplot(2,2,1)
plot(time,u3);
xlabel('time');ylabel('u(t)');grid on;
subplot(2,2,2)
plot(t2,y2);
xlabel('time');ylabel('V2');grid on;
subplot(2,2,3)
plot(t2,x2(:,1));
xlabel('time');ylabel('I1(t)');grid on;
subplot(2,2,4)
plot(t2,x2(:,2));
xlabel('time');ylabel('I2(t)');grid on; 