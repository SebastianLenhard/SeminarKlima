%% Nichtlineares Recharge-Oscillator-Modell ohne Vereinfachungen
%-> Funktioniert schlecht, zu viele Konstanten (in Fkt 

%Anfangsbedingungen
condTe = 0.61;
condhw = -10;
conds = [condTe, condhw];

%DGL
S = ode45(@(t,y) recharge_dgl_1(t,y), [0 40], conds);

plot(S.x, S.y(1,:), 'r')
figure;
plot(S.x, S.y(2,:), 'g')


%% Liniearisiertes, dimensionsloses Modell
%-> Funktioniert, die Werte sind aber schwerer zu interpretieren

%Anfangsbedingungen
condX = 0;
condY = 0;
conds = [condTe, condhw];

%DGL
opts = odeset('MaxStep', 0.01); % Definieren der max. Schrittweite
S = ode45(@(t,y) recharge_dgl_2(t,y), [0 40], conds, opts);

plot(S.x, S.y(1,:), 'r') 
hold;
plot(S.x, S.y(2,:), 'g')
legend('Te', 'hw');
xlabel('t(Month)');
ylabel('Te/hw scaled');
figure;
plot(S.y(1,:), S.y(2,:), 'y')
xlabel('Te scaled');
ylabel('hw scaled');




