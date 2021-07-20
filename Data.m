clear;clc
t = 1:84;
tS1 = 1:25;
tS2 = 26:84;
tR1 = 1:15;
tR2 = 16:84;
tD1 = 1:20;
tD2 = 21:84;
S = table2array(readtable('COVIDdata.xlsx','Range','C9:CH9','PreserveVariableNames',1));
% S1 = S(1:25);
% S2 = S(26:end);
% I = table2array(readtable('COVIDdata.xlsx','Range','C8:CH8'));
% R = table2array(readtable('COVIDdata.xlsx','Range','C11:CH11'));
% R1 = R(1:15);
% R2 = R(16:end);
% D = table2array(readtable('COVIDdata.xlsx','Range','C10:CH10'));
% D1 = D(1:20);
% D2 = D(21:end);
% plot(t,S,'o')
% title('Susceptible 1')
% xlabel('Days After January 23rd')
% ylabel('Number of People')
% figure(2)
% plot(t,I,'o')
% title('Infected')
% xlabel('Days After January 23rd')
% ylabel('Number of People')
% figure(3)
% plot(t,R,'o')
% title('Recovered')
% xlabel('Days After January 23rd')
% ylabel('Number of People')
% figure(4)
% plot(t,D,'o')
% title('Dead')
% xlabel('Days After January 23rd')
% ylabel('Number of People')
