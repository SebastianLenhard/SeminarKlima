function P_m2 = P_blackbody(T)
    global PLANET;
    global CONST;
    
    P = 4* pi * PLANET.R^2 * CONST.sigma * T.^4;
    P_m2 = P / (4* pi * PLANET.R^2);
end
