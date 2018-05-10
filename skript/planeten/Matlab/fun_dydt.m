function dydt = fun_dydt(t,y)
%DTDT Summary of this function goes here
%   Detailed explanation goes here

    T_s    = y(1);
    T_t    = y(2);
    h2o    = y(3);
    clouds = y(4);

    T_grad = T_s - T_t; 
    P_in = P_absorption() * (1-albedo(clouds));
    P_out = P_blackbody(T_s) * (1-greenhouse(h2o));
    
    p1 = 1;
    p2 = 1e-2;
    p3 = 1e1;
    p4 = 1.7e-2;
    p5 = 4e-1;
    p6 = 1.5e-3;
    
    
    d_T_s    =    p1*(P_in - P_out) - p2*h2o*T_s;
    d_T_t    =                        p2*h2o*T_s - P_blackbody(T_t) + p3*(T_grad * h2o);
    d_h2o    =    p6*(P_in) - p4*((h2o^9 + h2o) * T_grad);    
    d_clouds =                p4*((h2o^9 + h2o) * T_grad) - p5*(clouds^5 + clouds); % - clouds * convection;
   
    
    
%     d_h2o = vaporisation(T_s) *1e-1 + ( -escape(T_t) - precipitation(T_s) ) * h2o;

    dydt = [d_T_s; d_T_t; d_h2o; d_clouds];
end
