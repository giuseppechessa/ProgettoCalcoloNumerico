function [zero ,res ,niter ]= broyden(fun ,B0 ,x0 ,tol , kmax)
k = 0;
diff = tol +1;
while diff >= tol && k < kmax
    k = k + 1;
    deltax=-B0\fun(x0);                                  %passo 1
    x1=x0+deltax;                                        %passo 2
    deltaf=fun(x1)-fun(x0);                              %passo 3
    B0=B0+(deltaf-B0.*deltax')/( deltax'* deltax );      %passo 4
    x0=x1;                                               %passo 5
    diff = norm(deltax);
end
zero = x1; res = norm(fun(x1));
if (k==kmax && diff > tol)
    fprintf("Errore,troppe iterazioni");
end
niter=k;