function sol = simple_dde_solver(dde, tau, dde_hist, interval)
% Einfacher Solver fuer verzoegerte Differentialgleichungen
%   Arbeitet numerisch, d.h. es werden kleine Schritte gerechnet
steps = 10000;
sol.x = linspace(interval(1), interval(2), steps);
dt = (interval(2)-interval(1))/steps;
sol.y(1) = dde_hist(0);
t_end = interval(2);
idx_y = 1;
idx_tau = 0;
for t = 0 : dt : t_end - 2*dt   % iteration ueber die ganze Zeit
    tau_y = tau < t;    % alle verzoegerten Werte ohne history finden (t>0)
    idx_tau = idx_tau + tau_y;
    for i = 1 : 1 : size(tau,2)   %alle Werte von tau auswerten
        if tau_y(i) == 1
            Z(:,i) = sol.y(idx_tau(i));
        else
            Z(:,i) = dde_hist(t-tau(i));
        end
    end 
    dydt = dde(t, sol.y(idx_y), Z); %dy berechnen (fuer kleine Zeit dt)
    idx_y = idx_y + 1;
    sol.y(idx_y) = sol.y(idx_y-1) + dt * dydt;  %kurze Zeit linearisieren
end
