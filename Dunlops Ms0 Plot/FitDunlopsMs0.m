load('Tc_of_x.mat'); 
x = Tc_of_x(:,1);
Tc = Tc_of_x(:,2); 

p = polyfit(x, (Tc-580)./x,1);
a = p(1); 
b = p(2); 

Tcc = a*xx.^2 + b.*xx + 580; 
xx = linspace(0,1); 

figure(1); 
clf
plot(x, Tc, 'ok'); 
hold on 
plot(xx, Tcc, '-k'); 
legend('Dunlop', 'Fit model'); 
xlabel('Composition x (Fe_{3-x}Ti_xO_4)'); 
ylabel('Curie temperature T_C [°C]'); 
grid on


