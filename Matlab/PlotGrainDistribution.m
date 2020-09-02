function PlotGrainDistribution(scenario_number, scenario_description, f, V, Tc, shape, tau0)
    
    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    contourf(V.^(1/3)/1e-9,Tc-273,log10(f));     
    colormap(flipud(colormap('gray')));
    %colorbar
    xlabel('Volume [nm]'); 
    ylabel('T_c [°C]'); 
    title('f(V,T_c)'); 
    set(gca,'xscale','log')
    xlim([1e1 1e2])
    ax = gca; 
    ax.XAxis.TickValues = 10:10:100;
    grid on
    
    %set(gcf,'PaperPositionMode','auto');
    %saveas(gcf, sprintf('..\\Output\\GrainDistributions\\f %03d. %s.png',scenario_number, scenario_description), 'png');
    %saveas(gcf, sprintf('..\\Output\\GrainDistributions\\f %03d.eps',scenario_number), 'epsc');

    
    
%     fh = figure(2); 
%     set(fh, 'Position', [100, 100, 500, 500]);
%     clf
%     
%     mu0 = pi*4e-7; 
%     kB = 1.38e-23;
%     Ms0 = CalculateMs0(Tc);
%     T = 20 + 273; 
%     ms = Ms0 .* sqrt(1 - (T./Tc)); 
%     ms(T>Tc) = 0; 
%     
%     f1 = 10; 
%     H1 = shape .* ms - sqrt(2.*shape.*kB.*T.*log(1./(2.*f1.*tau0)) ./ (mu0.*V)); 
%     f2 = 200; 
%     H2 = shape .* ms - sqrt(2.*shape.*kB.*T.*log(1./(2.*f2.*tau0)) ./ (mu0.*V)); 
%     
%     contourf(H1*mu0*1000, H2*mu0*1000, log10(f));     
%     colormap(flipud(colormap('gray')));
%     %colorbar
%     xlabel('H(f=10 Hz) [mT]'); 
%     ylabel('H(f=200 Hz) [mT]'); 
%     title('f(V,T_c)'); 
%     %set(gca,'xscale','log')
%     %xlim([1e1 1e2])
%     %ax = gca; 
%     %ax.XAxis.TickValues = 10:10:100;
%     axis([0 100 0 100]);
%     grid on
    
end