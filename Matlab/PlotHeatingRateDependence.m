function PlotHeatingRateDependence(scenario_number, scenario_description, rates, slopes, ratelabels)

    fh = figure(3); 
    set(fh, 'Position', [100, 500, 500, 500]);
    
    ratios = -1./slopes; 
    p = polyfit(log(rates), ratios, 1);
    semilogx(rates, polyval(p, log(rates)), 'k-');
    hold on
    semilogx(rates, ratios, 'sk', 'MarkerFaceColor', 'w');
    grid on
    grid minor
    xlabel('Cooling time [s]'); 
    ylabel('Ratio NRM/pTRM'); 
    ylim([0.95 1.65]);
    
    ax = gca;
    ax.XTick = rates;
    ax.XTickLabel = ratelabels;


    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Thellier Rate\\Thellier Rate %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Thellier Rate\\Thellier Rate %03d.eps', scenario_number), 'epsc'); 


end