function PlotZijderveldAf(scenario_number, scenario_description, ...
        f, mr, V, Tc, T, freq, tau0, shape)

    Htilde = logspace(log10(1e-3), log10(1), 200);   
    HtildeLabels = [1 5 10:10:100 120:20:200 300];
    if scenario_number == 46 || scenario_number == 47 || scenario_number == 48
        HtildeLabels = [1 10 25 30 40 55 75 100:20:180 220];
    elseif scenario_number == 54 || scenario_number == 97 || scenario_number == 98
        HtildeLabels = [1 10 15 23 30 40 50 72];
    elseif scenario_number == 102 || scenario_number == 103 || scenario_number == 104
        HtildeLabels = [1 10:10:80 100 120 150 220];
    end
    
    Mr = AfDemagnetization(f, mr, V, Tc, T, freq, Htilde, tau0, shape); 
            
    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    
    Zijderveld(Mr, Htilde'*1000, HtildeLabels); 
    ZijderveldLabel(Mr, Htilde'*1000, HtildeLabels); 
%     title('AF');
%     xlabel('ChRM [Am^2]');
%     if isempty(strfind(scenario_description, 'VRM'))
%         ylabel('pTRM [Am^2]');
%     else
%         ylabel('VRM [Am^2]');
%     end
    
    if scenario_number == 47
        text(0.05e-9, 0.1e-9, sprintf('Magnetite ChRM'), 'Rotation', 0, 'FontSize', 14)
        text(1.35e-9, 0.4e-9, sprintf('TM60\nChRM'), 'Rotation', 20, 'FontSize', 14)
        text(1.63e-9, 0.6e-9, sprintf('TM60 pTRM'), 'Rotation', 90, 'FontSize', 14)
        text(1.2e-9, 0.06e-9, sprintf('Magnetite\npTRM'), 'Rotation', 90, 'FontSize', 14)
    elseif scenario_number == 97
        text(1.8e-8, 1.8e-8, sprintf('Magnetite + \nHigh Ti pTRM'), 'Rotation', 90, 'FontSize', 14)
        text(0.3e-8, 0.8e-8, sprintf('Intermediate Ti\npTRM+ChRM'), 'Rotation', 30, 'FontSize', 14)
    elseif scenario_number == 98
        text(1.7e-8, 0.35e-8, sprintf('Magnetite + \nHigh Ti pTRM'), 'Rotation', 90, 'FontSize', 14, 'HorizontalAlignment', 'left')
        text(0.5e-8, 0.26e-8, sprintf('Intermediate Ti\npTRM+ChRM'), 'Rotation', 13, 'FontSize', 14)
        text(0.02e-8, -0.1e-8, sprintf('Intermediate Ti, \nmostly ChRM'), 'Rotation', 0, 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top')
    end

    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Zijderveld AF\\Zijderveld AF %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Zijderveld AF\\Zijderveld AF %03d.eps', scenario_number), 'epsc'); 

end