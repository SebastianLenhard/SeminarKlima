function dde_model_laplace
%Berechnet approximativ die Laplace-Inversion fuer bestimmte Zeiten t
F = @(s) LFun(s);
steps = 1000; tmax = 1;
for i=1 : 1 : steps
    t = tmax*i/steps;
    sol(i) = gavsteh(F,t,16);
end
t_plot = linspace(0,tmax,steps);
plot(t_plot,sol)
end

function F = LFun(s)
%Laplacetransformierte der DDE
F = -0.81/(s+1-2.6*exp(-0.5*0.15*s)+3*exp(-(0.5+0.15)*s));
end
