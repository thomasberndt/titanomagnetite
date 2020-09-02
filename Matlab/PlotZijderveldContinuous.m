function PlotZijderveldContinuous(scenario_number, scenario_description, ...
        f, mr, V, Tc, T, t, tau0, shape)
    Mr = ContinuousDemagnetization(f, mr, V, Tc, T, t, tau0, shape); 

    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    Zijderveld(Mr, T-273); 
    ZijderveldLabel(Mr, T'-273, 20:20:580); 
    title('Continuous');
    
    xlabel('ChRM [Am^2]');
    if isempty(strfind(scenario_description, 'VRM'))
        ylabel('pTRM [Am^2]');
    else
        ylabel('VRM [Am^2]');
    end

    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Zijderveld Continuous\\Zijderveld Continuous %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Zijderveld Continuous\\Zijderveld Continuous %03d.eps', scenario_number), 'epsc'); 

end