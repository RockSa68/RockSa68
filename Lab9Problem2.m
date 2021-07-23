x=[2.5 3 3.5 4 4.5 5 5.5 6 7 8 9 10];
y=[1500 1220 1050 915 810 745 690 620 520 480 410 390];
p=polyfit(x,y,1);
J=sum((polyval(p,x)-y).^2);
S=sum((y-mean(y)).^2);
y1=polyval(p,x)
ssr1=mean((y-y1).^2)
p1=polyfit(x,log10(y),1);
y2=10.^polyval(p1,x);
J1=sum((polyval(p1,x)).^2);
S1=sum((y2-mean(y2)).^2);
ssr2=mean((y-y2).^2)
p2=polyfit(log10(x),log10(y),1);
coeffs=[p2(1),10^p2(2)];
m=coeffs(1);
b=coeffs(2);
y3=b*x.^m;
J2=sum(y3.^2);
S2=sum((y3-mean(y3)).^2);
ssr3=mean((y-y3).^2)
plot(x,y,'o')
hold on
plot(x,y1,'r')
plot(x,y2,'g')
plot(x,y3,'b')
hold off