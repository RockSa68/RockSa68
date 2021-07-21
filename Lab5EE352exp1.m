
Vt=.026;
n=1.87;
Vd= linspace(0,.8);
Is=6.3e-9;
Id=Is*exp(Vd/(n*Vt));
plot(Vd,Id);
grid on
grid minor
