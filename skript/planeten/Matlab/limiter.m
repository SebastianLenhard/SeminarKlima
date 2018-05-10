a = linspace(0,1.2,100);
plot(a, a); hold on
% for i = 2:10
% plot(a, a + a.^(i*2 - 1));
% end
plot(a, a + a.^11); hold on
hold off;
ylim([0,2.5])