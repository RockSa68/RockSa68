t=(-.02:.0001:.02);
c=.0044;
y=zeros(size(t));
for k=(-3:3)
    yk=20/((pi*(4*k*2-1))*(1+4*c*1i*k*754));
    y=y+yk*exp(-1i*754*k);
end
plot(t,y)
    