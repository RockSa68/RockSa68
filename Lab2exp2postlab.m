clear;
Rs=50; %Ohms
R1=68; %Ohms
R2=1; %Ohms
RL=2; %Ohms
L=.001; %Henry's
C=.00001; %Farads
%Step 1 Obtain A B C and D
A=[-(1/(C*(Rs+R1))) -1/C; 1/L -((R2+RL)/L)]
B=[(1/(C*(Rs+R1))); 0]
C=[1 0; 0 1]
D=[0; 0];
%Step 2 Simulate the step response
SYS = ss(A,B,C,D);
[Y,T,X]=step(SYS);
figure % display new graph
subplot(2,1,1)
plot(T,X(:,1),'LineWidth',2);
xlabel('time');ylabel('x1(t)');grid on;
subplot(2,1,2)
plot(T,X(:,2),'LineWidth',2);
xlabel('time');ylabel('x2(t)');grid on;
figure;
plot(X(:,1),X(:,2),'LineWidth',2);
xlabel('x1(t)');ylabel('x2(t)');grid on; 