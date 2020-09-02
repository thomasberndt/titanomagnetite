function PlotZijderveldStepwise(scenario_number, scenario_description, ...
        f, mr, V, Tc, T, t, tau0, shape)

    Mr = StepwiseDemagnetization(f, mr, V, Tc, T, t, tau0, shape); 

    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    Tlabels = [20:20:160 200:50:500 570];
    if scenario_number == 98 
        Tlabels = [20 40 50:10:160 200];
    elseif scenario_number == 97 
        Tlabels = [20 60:10:180 200];
    elseif scenario_number == 54
        Tlabels = [20 60 80 100:10:170 200];
    elseif scenario_number == 102 || scenario_number == 103 || scenario_number == 104
        Tlabels = [20:20:200 230 260 300 350 400 570]; 
    end
    
    Zijderveld(Mr, T-273, Tlabels); 
    ZijderveldLabel(Mr, T'-273, Tlabels); 
%     title('Stepwise');
%     xlabel('ChRM [Am^2]');
%     if isempty(strfind(scenario_description, 'VRM'))
%         ylabel('pTRM [Am^2]');
%     else
%         ylabel('VRM [Am^2]');
%     end
%     
    if scenario_number == 97
        text(1.8e-8, 2.9e-8, sprintf('Magnetite + \nHigh Ti pTRM'), 'Rotation', 90, 'FontSize', 14, 'HorizontalAlignment', 'Right')
        text(1.4e-8, 0.9e-8, sprintf('High Ti\nChRM +\nlow-intermediate\nTi pTRM'), 'Rotation', 35, 'FontSize', 14, 'HorizontalAlignment', 'center')
        text(0.05e-8, 0.05e-8, sprintf('Inter-\nmediate\nTi ChRM'), 'Rotation', 0, 'VerticalAlignment', 'Bottom', 'FontSize', 14)
    end
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Zijderveld Stepwise\\Zijderveld Stepwise %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Zijderveld Stepwise\\Zijderveld Stepwise %03d.eps', scenario_number), 'epsc'); 

end