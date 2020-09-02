function PlotMomentDistributionY(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape)
    
    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    Ms0 = CalculateMs0(Tc);
    
    
    m1 = mr(:,:,1).*V.*f.*Ms0; 
    m2 = mr(:,:,2).*V.*f.*Ms0; 
    
    maxMr = max(max(m1(:)),max(m2(:))); 
    if maxMr == 0
        c = 0;
    else
        c = logspace(log10(maxMr)-2, log10(maxMr),10); 
    end
    
    
    
    contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
    colormap(flipud(colormap('gray')));
%     colorbar
    xlabel('Volume [nm]'); 
    ylabel('T_c [C]');     
    title('M_r (ChRM)'); 
    set(gca,'xscale','log')
    grid on
    xlim([0.99e1 1e2])
    grid minor 
    
    PlotActicationLinesOnMomentPlots(scenario_number, tau0, shape);
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\MomentY\\Moment Y %03d. %s.png',scenario_number, scenario_description), 'png');
    saveas(gcf, sprintf('..\\Output\\MomentY\\Moment Y %03d.eps',scenario_number), 'epsc');

    
end