function [t,y]=CalcoloScript(b,sigma,g,S0,E0,I0)
    Tfine=1000;
    passo=0.1;

    %b=0.055;
    %sigma=0.005;
    %g=0.04;

    N=10000;
    %S0=5000;
    %E0=5000;
    %I0=0;
    R0=0;

    h=0:passo:Tfine;
    SIERModel=@(t,y)[(-b/N)*y(1)*y(2);sigma*y(3)-g*y(2);(b/N)*y(1)*y(2)-sigma*y(3);g*y(2)];
    [t,y]=cranknic(SIERModel,[S0;I0;E0;R0],h);

    %plot(t,y);
    %legend({'S','I','E','R'},'Location','southwest')
end
