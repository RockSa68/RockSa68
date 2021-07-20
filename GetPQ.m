% Choose the datafile name and read data
[datafile] = uigetfile('*.txt','Choose Data File');
data=load(datafile);

x=data(:,1);
P=data(:,2);
Q=data(:,3);
n=length(x);
T=x(n);

% Data are interpolated to yield a sampling interval of dt seconds.
dt=0.001;
t=0:dt:x(n);
np=length(t);
P_new=interp1(x,P,t,'spline');
Q_new=interp1(x,Q,t,'spline');

% Calculate minimum, maximum, and mean pressure and flow 
minP=min(P_new);
maxP=max(P_new);
meanP=mean(P_new);

% Calculate minimum, maximum, and mean pressure and flow 
minQ=min(Q_new);
maxQ=max(Q_new);
meanQ=mean(Q_new);

% Also calculate and systemic vascular resistance (SVR)
SVR=meanP/meanQ;

% Create structures so that SIMULINK can access these data
% Data structure will have pressure or flow data.
AOP.time=zeros(1,np);
AOP.time=[];
AOP.signals.values=P_new';
AOP.signals.dimension=1;

AOF.time=zeros(1,np);
AOF.time=[];
AOF.signals.values=Q_new';
AOF.signals.dimension=1;

% Display certain pressure values and SVR
fprintf(1,'              Minimum AOP_Measured = %7.1f mmHg \n',minP)
fprintf(1,'              Maximum AOP_Measured = %7.1f mmHg \n',maxP)
fprintf(1,'                 Mean AOP_Measured = %7.1f mmHg \n',meanP)
fprintf(1,'                 Mean AOQ_Measured = %7.1f ml/s \n',meanQ)
fprintf(1,'Systemic Vascular Resistance (SVR) = %7.3f mmHg.s/ml \n',SVR)