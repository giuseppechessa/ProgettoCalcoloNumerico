function [t,y]=FunzioneCalcoloSistema(b,sigma,g,N,S0,E0,I0,R0,Tfine,passo)
    h=0:passo:Tfine;
    SIERModel=@(t,y)[(-b/N)*y(1)*y(2);sigma*y(3)-g*y(2);(b/N)*y(1)*y(2)-sigma*y(3);g*y(2)];
    [t,y]=cranknic(SIERModel,[S0;I0;E0;R0],h);

    
end
