function [t,u]= cranknic(fun ,tspan ,y0 ,Nh)
tol =1.e-8;
kmax =200;
h2=( tspan(2)-tspan (1))/(2*Nh); 
t=linspace(tspan(1),tspan(2),Nh+1)';
d=numel(y0);
u=zeros(Nh+1,d);
B0=eye(d); % matrice iniziale per innestare Broyden
u(1 ,:)=y0; % trasposta anche di variabili complesse
for n=1:Nh
    F=@(x)x-u(n,:)' -h2*( fun(t(n),u(n,:)')+ fun(t(n+1),x));
    u(n+1 ,:)=(broyden(F,B0 ,u(n,:)' ,tol ,kmax))';
end