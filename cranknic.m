function [t,u]= cranknic(fun,y0,t)
tol =1.e-8;
kmax =200;
h2=( t(2)-t(1))/(2); 
d=numel(y0);
num=numel(t);
u=zeros(num,d);
B0=eye(d); % matrice iniziale per innestare Broyden
u(1 ,:)=y0; % trasposta anche di variabili complesse
for n=1:num-1
    F=@(x)x-u(n,:)' -h2*( fun(t(n),u(n,:)')+ fun(t(n+1),x));
    u(n+1 ,:)=(broyden(F,B0 ,u(n,:)' ,tol ,kmax))';
end