function P_m2 = P_absorption()
    global PLANET;
    global CONST;
    %P_in = sigma * pi*R_mars^2 * (R_sun/A_mars)^2 * T_sun.^4;
    P = pi * PLANET.R^2 * (CONST.R_sun / PLANET.A)^2 * CONST.sigma * CONST.T_sun^4;
%     P = So/4; ??
    P_m2 = P / (4* pi * PLANET.R^2);
    
    
    
    
%     SUN.spectrum * blah
    
    
    
    
end