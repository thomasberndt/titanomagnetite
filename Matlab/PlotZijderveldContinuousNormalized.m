function PlotZijderveldContinuousNormalized(scenario_number, scenario_description, ...
        f, mr, V, Tc, T, t, tau0, shape)
    Ms = MsCurve(f, V, Tc, T); 
    Ms = [Ms, Ms]; 
    Mr = ContinuousDemagnetization(f, mr, V, Tc, T, t, tau0, shape); 

    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    Zijderveld(Mr./Ms, T-273); 
    ZijderveldLabel(Mr./Ms, T'-273, 20:20:580); 
    title('Continuous Normalized');
    
    xlabel('ChRM [Am^2]');
    if isempty(strfind(scenario_description, 'VRM'))
        ylabel('pTRM [Am^2]');
    else
        ylabel('VRM [Am^2]');
    end
    
    if scenario_number == 97
        text(0.0e-8, 0.2e-8, sprintf('Intermediate Ti \nChRM'));
        text(1.1e-8, 0.4e-8, sprintf('        High Ti ChRM + \nlow-intermediate Ti pTRM'), 'Rotation', 45);
        text(1.9e-8, 1.5e-8, sprintf('Magnetite + High Ti VRM,\nnormalized by M_s(T) due to \nlow Ti, high Ti and magnetite'), 'Rotation', 85);
    elseif scenario_number == 98
        text(0.5e-8, 0.1e-8, 'Intermediate Ti ChRM');
        text(2.1e-8, 0.1e-8, sprintf('Magnetite + High Ti VRM,\nnormalized by M_s(T) due to \nlow Ti, high Ti and magnetite'), 'Rotation', 85);
    end
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Zijderveld Continuous Normalized\\Zijderveld Continuous Normalized %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Zijderveld Continuous Normalized\\Zijderveld Continuous Normalized %03d.eps', scenario_number), 'epsc'); 

end