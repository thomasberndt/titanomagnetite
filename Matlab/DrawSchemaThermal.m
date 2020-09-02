tau0 = 1e-9; 
shape = 0.5;

fh = figure(1); 
set(fh, 'Position', [100, 100, 500, 500]);
clf

yr = 3600*24*365.25;
DrawActivationLine(100+273, 1, tau0, shape, 'k-', 1);
hold on
DrawActivationLine(130+273, 1, tau0, shape, 'k-', 1);
DrawActivationLine(60+273, 24*3600, tau0, shape, 'r-', 1);
DrawActivationLine(90+273, 24*3600, tau0, shape, 'r-', 1);

text(1e2, 145, '120°C'); 
text(1e2, 240, '230°C'); 


legend('1 s, varying temperature', '20°C, varying time', '20°C, varying field (50 Hz AF)', ...
        'location', 'best');
axis([10 100 20 580]);
grid on 
xlabel('Volume [nm]');
ylabel('T_C [°C]');