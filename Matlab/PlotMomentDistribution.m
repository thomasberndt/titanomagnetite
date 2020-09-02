function PlotMomentDistribution(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape)

    if scenario_number > 50
        lw = 1;
    else
        lw = 1.3; 
    end

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
    
    contour(V.^(1/3)/1e-9, Tc-273, real(m1), c, 'k-', 'LineWidth', lw); 
    colormap(flipud(colormap('gray')));
    hold on
    contour(V.^(1/3)/1e-9, Tc-273, real(m2), c, 'k:'); 
%     colorbar
    xlabel('Volume [nm]'); 
    ylabel('T_c [C]'); 
%     if isempty(strfind(scenario_description, 'VRM'))
%         title('M_r (pTRM)');
%     else
%         title('M_r (VRM)');
%     end
    set(gca,'xscale','log')
    grid on
    xlim([1e1 1e2])
    ax = gca; 
    ax.XAxis.TickValues = 10:10:100;
    
    PlotActicationLinesOnMomentPlots(scenario_number, tau0, shape);
    
    grid off 
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Moment\\Moment %03d. %s.png',scenario_number, scenario_description), 'png');
    saveas(gcf, sprintf('..\\Output\\Moment\\Moment %03d.eps',scenario_number), 'epsc');

    
end