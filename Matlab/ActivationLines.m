


shape = 0.5;  
tau0 = 1e-10;

figure(10)
clf

% T = linspace(273, 580+273,10);
T = (0:100:550)+ 273;
t = 100;
t2 = 1e2*yr;
for n = 1:length(T)
    [v, Tc] = DrawActivationLine(T(n), t, tau0, shape, 'r-'); 
    f = find(v == max(v), 1, 'first'); 
    text(v(end), Tc(end)-273, num2str(T(n)-273), 'Color','red');
    text(v(f), Tc(f)-273, num2str(T(n)-273), 'Color','red');
    hold on; 
    [v, Tc] = DrawActivationLine(T(n), t2, tau0, shape, 'b-'); 
    f = find(v == max(v), 1, 'first'); 
    text(v(end), Tc(end)-263, num2str(T(n)-273), 'Color','blue');
    text(v(f), Tc(f)-263, num2str(T(n)-273), 'Color','blue');
end

Htilde = [0 10 20 30 40] * 1e-3; 
for n = 1:length(Htilde)
    [v, Tc] = DrawAfActivationLine(Htilde(n), 273, 50, tau0, shape, 'k-'); 
    f = find(v == max(v), 1, 'first'); 
    text(v(end), Tc(end)-273, num2str(Htilde(n)*1e3), 'Color','k');
    text(v(f), Tc(f)-273, num2str(Htilde(n)*1e3), 'Color','k');
end


% T = 100+273;
% t = logspace(0, 16, 10);
% for n = 1:length(t)
%     DrawActivationLine(T, t(n), tau0, N, 'y-'); 
% end


grid on 
grid minor
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 