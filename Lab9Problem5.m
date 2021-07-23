% x=0:.5:pi/2;
% y=sin(x);
% err=(y-x)./y;
% find(err<.05);
% max(err)
% x1=0:.01:pi/2;
% y1=sin(x1);
% err1=(y1-x1)./y1;
% find(err1<.05);
% max(err1)
clear
clc
x=0:.01:(pi/2);
x7=0:.0001:.5385;
x8=0:.0001:.2441;
y=sin(x);
y2=sin(x7);
y3=sin(x8);
subplot(3,1,1)
plot(x,y,x,x), ylabel('sin(x) and x'),xlabel('x(Radians)')
title('Problem 5')
legend('sin(x)','x','Location','Best')
subplot(3,1,2)
plot(x7,y2,x7,x7), xlabel('x(Radians),y<.05')
subplot(3,1,3)
plot(x8,y3,x8,x8), xlabel('x(Radians),y<.01')

dx1=.0001;
x1=0;
y4=0;
while y4<.05
    x1=x1+dx1;
    y4=abs((sin(x1)-x1)/sin(x1));
end
x1
y4

dx2=.0001;
x2=0;
y5=0;
while y5<.01
    x2=x2+dx2;
    y5=abs((sin(x2)-x2)/sin(x2));
end
x2
y5
