function dde_model
%Verzoegerte Differentialgleichung zur Beschreibung des ElNino
%   siehe Buch, Seite 200, Equation 16.18
%   
tauk = 0.15; taur = 1; c = 1; a = 2.6; b = 3; e = 0.1;
tau = [0.5*tauk 0.5*taur+tauk];
my_dde = @(t,y,Z) dde_full(t,y,Z,c,a,b,e);
sol = simple_dde_solver(my_dde,tau,dde_hist,[0, 1]);
%sol = dde23(my_dde,tau,dde_hist,[0, 1]);
plot(sol.x,sol.y)


function s = dde_hist(t)
% Funktion der Anfangswerte, hier von Januar 1995 bis September 1995
% Kontrollfunktion: 
% f=[-0.81,-0.91,-0.95,-0.95,-0.67,-0.65,-0.43,-0.78,-0.75,-0.54,-0.27,-0.39];
% t=linspace(0,1,12);
% Werte von http://www.cpc.ncep.noaa.gov/data/indices/sstoi.indices
%s = @(t) 0.71*(t<-0.67)+0.5*((t>-0.67)&(t<-0.58))-0.06*((t>-0.58)&(t<-0.5))-0.4*((t>-0.5)&(t<-0.42))-0.68*((t>-0.42)&(t<-0.33))-0.23*((t>-0.33)&(t<-0.25))-0.2*((t>-0.25)&(t<-0.167))-0.66*((t>-0.167)&(t<-0.083))-0.81*(t>-0.083);
t_v = [-0.67,-0.58,-0.5,-0.42,-0.33,-0.25,-0.167,-0.083,0]; % Time-Vector
s_v = [0.71,0.5,-0.06,-0.4,-0.68,-0.23,-0.2,-0.66,-0.81];   % Data-Vector
s = @(t) interp1(t_v,s_v,t);



function dydt = dde_full(t,y,Z,c,a,b,e)
% Verzoegerte Differentialgleichung zur Beschreibung des ElNino
%   siehe Buch, Seite 200, Equation 16.18
ylag1 = Z(:,1);
ylag2 = Z(:,2);
dydt = -c*y+a*ylag1-b*ylag2-e*y.^3;



