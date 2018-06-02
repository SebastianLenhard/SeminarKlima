function v = vaporisation(P_in)
    %vaporisation
        
    global MOLECULES
    global PLANET
    % He, o2, co2, h2o,
    % r = ((atan(T-273) / pi) + 0.5));
%     r = 1- exp(-(T-272)/200);
%     r = max(0, r);

    v = (P_in * 1e-2) * 1e2;
    
    % wikipedia:  70% of the average net radiative warming at the surface
end