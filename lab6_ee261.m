Vl=[297.26 595.2 892.8 1190.1 1488.2 1785.5 2083.5 2380.1 2678.5];
Il=[.378 .336 .294 .253 .210 .168 .126 .084 .042];
P=Vl.*Il;
R=Vl./Il;
figure (1)
plot(R,P,'b')
xlabel('R')
ylabel('P')
figure (2)
plot(Il,P,'r')
xlabel('Il')
ylabel('P')
figure (3)
plot(Vl,P,'g')
xlabel('V')
ylabel('P')
