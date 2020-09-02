tau0 = 1e-9; 
shape = 0.5;

fh = figure(1); 
set(fh, 'Position', [100, 100, 500, 500]);
clf

yr = 3600*24*365.25;
DrawActivationLine(20+273, 1, tau0, shape, 'k-', 1);
hold on

DrawActivationLine(20+273, 1.01e-9, tau0, shape, 'b-', 1);

DrawActivationLine(20+273, 1, tau0, shape, 'k--', 1.5);
DrawAfActivationLine(20e-3, 20+273, 50, tau0, shape, 'k:', 1.5);


DrawActivationLine(20+273, 24*3600, tau0, shape, 'k--',1.5);
DrawActivationLine(20+273, 4.6e9*yr, tau0, shape, 'k--',1.5);

DrawActivationLine(120+273, 1, tau0, shape, 'k-', 1);
DrawActivationLine(230+273, 1, tau0, shape, 'k-', 1);

DrawAfActivationLine(70e-3, 20+273, 50, tau0, shape, 'k:', 1.5);

text(1e2, 60, '1s,20°C'); 
text(1e2, 80, '1 day'); 
text(1e2, 100, '4.6 Ga'); 
text(1e2, 125, '20 mT'); 
text(1e2, 270, '70 mT'); 
text(1e2, 145, '120°C'); 
text(1e2, 240, '230°C'); 


legend('1 s, varying temperature', '20°C, varying time', '20°C, varying field (50 Hz AF)', ...
        'location', 'best');
axis([10 100 20 580]);
grid on 
xlabel('Volume [nm]');
ylabel('T_C [°C]');