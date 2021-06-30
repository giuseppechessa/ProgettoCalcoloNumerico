Tfine=1000;
passo=0.1;

b=0.055;
sigma=0.005;
g=0.04;

N=10000;
S0=5000;
E0=5000;
I0=0;
R0=0;

[t,y]=FunzioneCalcoloSistema(b,sigma,g,N,S0,E0,I0,R0,Tfine,passo);

plot(t,y);
legend({'S','I','E','R'},'Location','Best')