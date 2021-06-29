function [t,u]= cranknic(odefun ,tspan ,y0 ,Nh ,varargin)
if nargin == 4
    tol =1.e-8; kmax =2000;
else
    tol=varargin {1}; kmax=varargin {2};
end
h=( tspan(2)-tspan (1))/Nh; h2=h/2;
t=linspace(tspan(1),tspan(2),Nh+1)';
d=numel(y0);
u=zeros(Nh+1,d);
B0=eye(d); % matrice iniziale per innestare Broyden
u(1 ,:)=y0; % trasposta anche di variabili complesse
for n=1:Nh
    wn=u(n,:).';
    F=@(x)x-wn -h2*( odefun(t(n),wn)+ odefun(t(n+1),x));
    w=broyden(F,B0 ,wn ,tol ,kmax);
    u(n+1 ,:)=w.';
end