

clf
yr = 3600*24*365.25;
tau0 = 1e-10;
shape = 0.5; 
H = [10:10:300 ] * 1e-3;
H = [25 35] * 1e-3; 
H2 = [10 20] * 1e-3; 
for n = 1:length(H)
    
    f = 1000; 
    [v1,Tc] = DrawAfActivationLine(H(n), 20+273, f, tau0, shape, 'k-');
    hold on

    f =1;
    DrawAfActivationLine(H2(n), 20+273, f, tau0, shape, 'r-');

%     f =1/50;
%     [v2,Tc] = DrawAfActivationLine(H(n), 20+273, f, tau0, shape, 'k-');
end

legend('f=1000 Hz', 'f=1 Hz');
axis([10 100 20 580]);
grid on 
xlabel('Volume [nm]');
ylabel('T_C [°C]');