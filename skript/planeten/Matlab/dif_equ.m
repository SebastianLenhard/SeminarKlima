addpath('equations');

%% static parameter
global CONST;
CONST.sigma = 5.670367e-8;    % Stefan-Bolzmann Constant
CONST.R = 8.3144598;          % Gas-constant
CONST.k = 1.38064852e-23;     % Bolzmann Constant
CONST.T_sun = 5778; %K
CONST.R_sun = 6.957e8; %m

%% Planet parameter
global PLANET;

% http://claesjohnson.blogspot.ch/2010/04/black-body-temperatures-of-planets.html

VENUS.name = 'Venus';
VENUS.v_escape = 10.36e3;
VENUS.R = 6.0519e6; %m
VENUS.A = 1.076e11; %m
VENUS.T_surface = 465; %K;
VENUS.T_blackbody = 312; %K
VENUS.albedo = 0.689;
VENUS.cloud_cover = 0.99; %?

EARTH.g = 9.81;
EARTH.name = 'Earth';
EARTH.v_escape = 11.186e3;
EARTH.R = 6.371e6; %m
EARTH.A = 1.499e11; %m
EARTH.T0 = 273+10; %K
EARTH.T_mean = 288; %K
EARTH.T_blackbody = 275; %K
EARTH.albedo = 0.367;
EARTH.cloud_cover = 0.68;

MARS.name = 'Mars';
MARS.v_escape = 5.03e3;
MARS.R = 3.3895e6; %m
MARS.A = 2.353e11; %meters
MARS.T_mean = 232; %K
MARS.T_blackbody = 229; %K
MARS.albedo = 0.19;
MARS.greenhouse = 0.75; %?
MARS.cloud_cover = 0.05;

%% Molecules
% He, o2, co2, h2o,
global MOLECULES;
MOLECULES.names = {'He', 'o2', 'co2', 'h2o'};
MOLECULES.M_mol = [4e-3; 31.9988e-3; 44.01e-3; 18.01528e-3];

%% Simulation Parameter
SIM.T_s_0    = 273+10;%K
SIM.T_t_0    = SIM.T_s_0;
SIM.H2O_0    = 0.5;
SIM.clouds_0 = 0.5;

% PLANET = EARTH;

planets = {EARTH, VENUS, MARS};

colors = {[0,113,188]/255, [216,82,24]/255, [236,176,31]/255};

for i = 1:3
   p = planets(i);
   PLANET = p{1};

%% Solve diff equation
tspan = [0 40];
y0 = [SIM.T_s_0; SIM.T_t_0; SIM.H2O_0; SIM.clouds_0];

% y0 = y_end;
% y0(3) = 1;
% y0

[t,y] = ode45(@(t,y) fun_dydt(t, y), tspan, y0);
y_end = y(end, :)';

T_s    = y(:,1);
T_t    = y(:,2);
h2o    = y(:,3);
clouds = y(:,4);


%% Plot
PLANET.name
f = figure(i);
f.set('name',PLANET.name);

subplot(4,1,1);
plot(t, T_s, '-', 'color', colors{1}); hold on;
plot(t, ones(1,length(t)) * PLANET.T_blackbody, '-.', 'color', colors{1}); hold on;
plot(t, T_t, '-', 'color', colors{2}); hold off
title([ PLANET.name ' Temperature']);
ylabel('Temperature / K');
xlabel('Time');
ylim([200 350]);
legend({'Surface', 'Measured blackbody', 'Tropopause'});
grid

subplot(4,1,2)
plot(t, h2o * 100, '-', 'color', colors{1}); hold on;
plot(t, clouds * 100, '-', 'color', colors{2});
plot(t, ones(1,length(t)) * PLANET.cloud_cover * 100, '-.', 'color', colors{2}); hold off;
title('Atmospheric abundance');
legend({'Humidity', 'Cloud cover', 'Current cloud cover'});
ylabel('%');
xlabel('Time');
ylim([0, 110]);
grid;


%% other parameters

T_grad = T_s - T_t;
    
P_in = P_absorption() .* (1-albedo(clouds));
P_out = P_blackbody(T_s) .* (1-greenhouse(h2o));
    
Convection = P_in - P_out;
    
%% plot other parameters

subplot(4,1,3)
plot(t, 100 * albedo(clouds), 'color', colors{1}); hold on;
plot(t, 100 * ones(1,length(t)) * PLANET.albedo, '-.', 'color', colors{1});
plot(t, 100 * greenhouse(h2o)), 'color', colors{2}; hold off;
title('Albedo % Greenhouse effect')
legend({'Albedo', 'Current albedo', 'Greenhouse'});
ylim([-100*0.1, 100*1.1]);
xlabel('Time');
ylabel('%');
grid

subplot(4,1,4)
plot(t, P_in); hold on
plot(t, P_out); hold off;
title('Power budget')
legend({'P_{in}' 'P_{out}'});
xlabel('Time');
ylabel('Watts per m^2');
grid

% f = figure(i+3);
% f.set('name',PLANET.name);
% 
% T_vec = linspace(100, 400, 10);
% h = h2o(end);
% c = clouds(end) * ones(1, length(T_vec));
% 
% plot(T_vec, P_absorption() .* (1-albedo(c))); hold on
% plot(T_vec, P_blackbody(T_vec) .* (1-greenhouse(h))); hold off;
% title('Bifurkation budget')
% legend({'P_{in}' 'P_{out}'});
% xlabel('Surface Temperature');
% ylabel('Watts per m^2');
% grid


end



% subplot(4,1,4)
% plot(t, precipitation(T_s));
% plot(t, escape(T_t)); hold off;
% legend({'Precipitation' 'Escape'});
% ylim([-0.1 1.1]);
% grid
% 

%% vs T
% figure(3)
% T_x = linspace(0,273+100, 1000);
% plot(T_x, P_absorption() .* (1-albedo(T_x, Clouds_c, Clouds_s))); hold on;
% plot(T_x, P_blackbody(T_x) .* (1-greenhouse(h2o))); 
% hold off;
% xlim([0 400])
% ylim([0 400])
% legend({'P_in', 'P_out'});

%%

% figure(4)
% subplot(2,1,1)
% T = linspace(0,1000, 100);
% h2o = linspace(0, 1, 100);
% plot(T, precipitation(T)); hold on;
% plot(T, escape(T)); hold off;
% 
% legend({'precipitation', 'escape'});
% grid;
% title('h2o factors')


% subplot(2,1,2)
% for h2o_x = linspace(0,1,10)
%     plot(T, albedo(T, h2o_x)); hold on;
% end
% hold off;
% title('Albedo')
% ylabel('Albedo');
% xlabel('Temperature / K');
% ylim([0, 1]);