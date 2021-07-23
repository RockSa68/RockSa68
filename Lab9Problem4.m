clear;
clc;

t=5:5:45; %enter the values for t(min)
C=[0.3575,0.3010,0.2505,0.2095,0.18,0.15,0.1245,0.1070,0.0865]; %enter the values for C(mol/L)
y1=log(C);
y2=1./C;
y3=1./(2*C.^2);

%using the polyfit command
coeff1=polyfit(t,y1,1);
C10=exp(coeff1(2))
k1=-coeff1(1)
res1=C10*exp(-k1*t)-C;
coeff2=polyfit(t,y2,1);
C02=1/coeff2(2)
k2=coeff2(1)
res2=1./((1/C02)+k2*t)-C;
coeff3=polyfit(t,y3,1);
C03=1/(2*coeff3(2))
k3=coeff3(1)
res3=sqrt(1./((1./C03.^2)+2*k3*t))-C;

%plot the curves
plot(t,res1,t,res1,'*',t,res2,t,res2,'x',t,res3,t,res3,'o')
title('Chemical Concentration of a Reaction')
xlabel('t(minutes)')
ylabel('residuals')
legend({'First Order Reaction',' ','Second Order Reaction',' ','Third Order Reaction',' '},'location','northeast')
gtext('1st Order') %label the curves
gtext('2nd Order')
gtext('3rd Order')



