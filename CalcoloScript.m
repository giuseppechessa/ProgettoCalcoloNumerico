b=0.04;
sigma=0.2;
g=0.004;
N=10000;
%S=y(1)
%I=y(2)
%E=y(3)
%r=y(4)
S0=9900;
E0=500;
I0=500;
R0=0;
a=1;
if(a==1)
    SIERModel=@(t,y)[(-b/N)*y(1)*y(2);(b/N)*y(1)*y(2)-sigma*y(3);sigma*y(3)-g*y(2);g*y(2)];
    [t,y_eul]=cranknic(SIERModel,[0 100],[S0;I0;E0;R0],1000);
    %[t,y_eul]=ode45(SIERModel,[0 100],[S0,I0,R0]);
else
    SIRModel=@(t,y)[-b*(y(1)/N)*y(2);b*(y(1)/N)*y(2)-g*y(2);g*y(2)];
    [t,y_eul]=cranknic(SIRModel,[0 1000],[S0;I0;R0],1000);
    %[t,y_eul]=ode45(SIERModel,[0 100],[S0,I0,R0]);
end
h=0:0.1:100;

if(a==1)
    plot(t,y_eul);
    legend({'S','I','E','R'},'Location','southwest')
else
    plot(t,y_eul);
    legend({'S','I','R'},'Location','southwest')
end
