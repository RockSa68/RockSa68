clear

clc

t1=[0:0.01:2*pi]

t2=[0:0.5:2*pi]

t3=[0:1:2*pi]

y1=sin(t1)

y2=sin(t2)

y3=sin(t3)


subplot(6,1,1)

plot(t1,y1)
subplot(6,1,2)

plot(t2,y2)
subplot(6,1,3)

plot(t3,y3)

xlabel('t')

ylabel('y')

legend('sin(t1)', 'sin(t2)', 'sin(t3)')


% part B

x=t3

xi=[0 pi/2 (3*pi)/2]

yi= interp1(x,y3,xi)

subplot(6,1,4)

plot(x,y3,'-',xi,yi,'o-')

legend('actual sin(t3)', 'interpolation')


x1=t2

x2=[0 pi/2 (3*pi)/2]

y = interp1(x1,y2,x2)

subplot(6,1,5)

plot(x1,y2,'-',x2,y,'o-')

legend('actual sin(t2)','interpolation')
index=find(x1==pi/2);
errory2=abs(((y(index)-y2(index))*100)/y(index))
index2=find(x1==3*pi/2);
errory22=abs(((y(index2)-y2(index2))*100)/y(index2))
index3=find(x1==pi/2);
errory3=abs(((y(index3)-y3(index3))*100)/y(index3))
index4=find(x1==3*pi/2);
errory32=abs(((y(index4)-y3(index4))*100)/y(index4))
%part C

x=t3

xi=[0 pi/2 (3*pi)/2]

yi= spline(x,y3,xi)

subplot(6,1,6)
plot(x,y3,'-',xi,yi,'o-')

legend('actual sin(t3)', 'spline')
index5=find(x==pi/2);
errory33=abs(((y3(index5)-yi(index5))*100)/y3(index5))
index6=find(x==3*pi/2);
errory332=abs(((y3(index6)-yi(index6))*100)/y3(index6))