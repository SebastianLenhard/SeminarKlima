%static parameter
sigma = 5.670367e-8;    % Stefan-Bolzmann Constant
R = 8.3144598;          % Gas-constant
k = 1.38064852e-23;     % Bolzmann Constant 
g = 9.81;



%quasi static parameter
names = {'Venus' 'Earth' 'Mars'};
v_escape = [10.36e3 11.186e3 5.03e3];




syms fa(T, M);
fa(T, M) = sqrt(R * T / M);
%maxwell bolzman cdf
syms m_b_cdf(a,x);
m_b_cdf(a,x) = erf(x./(sqrt(2)*a)) - sqrt(2/pi)*(x .* exp((-x^2)./(2*a^2))) ./ a;
syms m_b_pdf(a,x)
m_b_pdf(a,x) = sqrt(2/pi)*(x^2 .* exp((-x^2)./(2*a^2))) ./ a^3;


M_He = 4e-3;
M_co2 = 44.01e-3;
M_watervapor = 18.01528e-3;
M_oxygen = 31.9988e-3;

%jeans escape
double(fa(200, M_co2));
syms fd_co2(T);

% % pdf, cdf plot
% figure(1)
% Vx = linspace(1,2500, 1000);
% subplot(2,1,1)
% prob = double( m_b_cdf(fa(298.15, M_He), Vx) );
% plot(Vx, prob)
% xlabel('Velocity')
% ylabel('cdf of escape')
% subplot(2,1,2)
% pdf = double( m_b_pdf(fa(298.15, M_He), Vx) );
% plot(Vx, pdf)
% xlabel('Velocity')
% ylabel('pdf of escape')


M_mol = [4e-3, 44.01e-3, 18.01528e-3, 31.9988e-3];
M_names = {'He','co2','h2o','o2'};
M_symbols = {'-', '--', '-.' ':'};

colors = {'blue', 'red', 'green', 'black'};

for i = 1:length(M_mol)
    figure(i)
    for j = 1:3
        Tx = linspace(1,10000, 100);
        pdf  = 1 - double( m_b_cdf(fa(Tx, M_mol(i)), v_escape(j)) );
        semilogy(Tx, pdf, 'LineStyle', char(M_symbols(j)), 'Color', char(colors(i))); hold on;
    end
    legend(names);
    xlabel('Temperature / K');
    ylabel('log cdf escape');
    ylim([1e-16 1])
    title(M_names(i))
    hold off;
end


%meanfree path
%meanfree_length = (k * T) / (sqrt(2) * pi * d^2 * p)
%scale height
%H = (k * T) / M * g


%Equations

% d_T = (P_asorption * (1-albedo) = (P_blackbody * greenhouse);
% 
% d_o2_atm = photodissociation + (-ablagerung -escape(T)) * o2_atm
% d_co2_atm = vulkan + (-ablagerung -escape) * co2_atm;


