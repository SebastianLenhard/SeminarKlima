%% Static parameter 
sigma = 5.670367e-8;    %Bolzmann Constant
R_mars = 3.3895e6; %m
T_earth = 273 + 10;
T_sun = 5778; %K
R_sun = 6.957e8;
A_mars = 2.353e11; %meters
T_mars = 226;%K
Albedo_mars = 0.19;
Epsilon_mars = 0.75;


T = 100:1:350;%K

%% Albedo
Albedo_mars_t = [0    50   100   150  180   200   226     230  270  350];
Albedo_mars_y = [0.85 0.85 0.85 0.85 0.85  0.85  0.19    0.15 0.15 0.15];
% p = polyfit(Albedo_mars_t, Albedo_mars_y, 5);
% Albedo_mars = polyval(p, T_mars)
Albedo_mars = interp1(Albedo_mars_t,Albedo_mars_y,T)


%% Calculations
P_in = (1-Albedo_mars) * sigma * pi*R_mars^2 * (R_sun/A_mars)^2 * T_sun.^4;

P_out =  4*pi*R_mars^2 * Epsilon_mars * sigma * T.^4;
% Epsilon_mars = P_in ./ ( 4*pi*R_mars^2 * sigma * T_mars.^4);

%% Plots
figure(1)

subplot(3,1,1)
plot(T, Albedo_mars)
title('Albedo over temperature');
xlabel('Temperature / K');
ylabel('Albedo');


subplot(3,1,2)
plot(T, P_in);
hold on;
plot(T, P_out);
lims = ylim
line([T_mars T_mars], ylim,'LineWidth',2);
line([T_earth T_earth],ylim,'LineWidth',2);
hold off;

title('Global incoming & outgoing Power over temperature');
xlabel('Temperature / K');
ylabel('Power');

subplot(3,1,3)
plot(T, P_in-P_out);

title('Global incoming & outgoing Power over temperature');
xlabel('Temperature / K');
ylabel('delta Power');
grid



