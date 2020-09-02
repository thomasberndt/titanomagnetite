function PlotActicationLinesOnMomentPlots(scenario_number, tau0, shape)
    yr = 3600*24*365.25; 
    fs = 15; 
    fs2 = 20; 
    hold on
    if scenario_number == 46 
        [vv, Tcc, hh] = DrawActivationLine(133+273, 600, tau0, shape, 'k-');
        [vv, Tcc, hh] = DrawActivationLine(206+273, 600, tau0, shape, 'k-'); 
        [vv, Tcc, hh] = DrawActivationLine(100+273, 4000*yr, tau0, shape, 'k--');
        text(3.1e1, 400, '206°C, 10 min', 'Rotation', -45, 'FontSize', fs);
        text(3.7e1, 320, '100°C,', 'Rotation', -48, 'FontSize', fs);
        text(4.7e1, 260, '100 ka', 'Rotation', -38, 'FontSize', fs);
        text(2.2e1, 400, '133°C, 10 min', 'Rotation', -50, 'FontSize', fs);
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 150, 'pTRM', 'FontSize', fs2);
    elseif scenario_number == 47
        [vv, Tcc, hh] = DrawAfActivationLine(25e-3, 20+273, 50, tau0, shape, 'k:');
        [vv, Tcc, hh] = DrawAfActivationLine(55e-3, 20+273, 50, tau0, shape, 'k:');
        [vv, Tcc, hh] = DrawAfActivationLine(75e-3, 20+273, 50, tau0, shape, 'k:');
        [vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k-', 2);
        [vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k--', 3);
        text(2.8e1, 425, '75 mT', 'Rotation', -40, 'FontSize', fs);
        text(2.65e1, 390, '55 mT', 'Rotation', -40, 'FontSize', fs);
        text(2.2e1, 330, '25 mT', 'Rotation', -45, 'FontSize', fs);
        text(3.05e1, 330, '100°C, 1 h', 'Rotation', -47, 'FontSize', fs);
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 150, 'pTRM', 'FontSize', fs2);
%         text(1.25e1, 560, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(2.5e1, 560, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(35, 210, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(65, 210, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
    elseif scenario_number == 48
        [vv, Tcc, hh] = DrawActivationLine(79+273, 600, tau0, shape, 'k-');
        [vv, Tcc, hh] = DrawActivationLine(139+273, 600, tau0, shape, 'k-'); 
        [vv, Tcc, hh] = DrawActivationLine(20+273, 100e3*yr, tau0, shape, 'k--');
        text(2.7e1, 400, '139°C, 10 min', 'Rotation', -50, 'FontSize', fs);
        
        text(3.0e1, 320, '20°C,', 'Rotation', -48, 'FontSize', fs);
        text(3.7e1, 270, '100ka', 'Rotation', -45, 'FontSize', fs);
        
        text(2.0e1, 400, '79°C, 10 min', 'Rotation', -58, 'FontSize', fs);
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 150, 'VRM', 'FontSize', fs2);
%         text(1.25e1, 560, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(2.5e1, 560, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(35, 210, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(65, 210, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
    elseif scenario_number == 54
        [vv, Tcc, hh] = DrawActivationLine(45+273, 600, tau0, shape, 'k-');
        [vv, Tcc, hh] = DrawActivationLine(110+273, 600, tau0, shape, 'k-'); 
        [vv, Tcc, hh] = DrawActivationLine(20+273, 100e3*yr, tau0, shape, 'k--');
        text(2.6e1, 280, '45°C, 10 min', 'Rotation', -45, 'FontSize', fs);
        text(2.75e1, 320, '20°C, 100ka', 'Rotation', -50, 'FontSize', 14.5);
        text(49, 220, '110°C, 10 min', 'Rotation', -22, 'FontSize', fs);
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 150, 'VRM', 'FontSize', fs2);
%         text(15, 490, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(85, 75, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(45, 270, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
        
    elseif scenario_number == 97
        [vv, Tcc, hh] = DrawActivationLine(115+273, 600, tau0, shape, 'k-');
        [vv, Tcc, hh] = DrawActivationLine(180+273, 600, tau0, shape, 'k-'); 
        [vv, Tcc, hh] = DrawActivationLine(100+273, 100e3*yr, tau0, shape, 'k--');
        semilogx([10, 31], [360 360],'k--');
        semilogx([31, 31], [20 360],'k--');
        semilogx([10, 90], [150 150],'k--');
        semilogx([90, 90], [20 150],'k--');
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 100, 'pTRM', 'FontSize', fs2);
%         semilogx([31 90], [360 150], 'ok'); 
%         text(10, 360, 'T_C=360°C', 'VerticalAlignment', 'Bottom');
%         text(10, 150, 'T_C=150°C', 'VerticalAlignment', 'Bottom');
%         text(31, 20, 'V_B=31 nm ', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Bottom');
%         text(90, 20, 'V_B=90 nm ', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Bottom');
        text(2.5e1, 340, '115°C, 10 min', 'Rotation', -45, 'FontSize', fs);
        text(5.0e1, 274, '180°C,', 'Rotation', -26, 'FontSize', fs);
        text(7.0e1, 238, '10 min', 'Rotation', -15, 'FontSize', fs);
%         text(15, 490, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(82, 110, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(45, 270, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
        
        [vv, Tcc, hh] = DrawAfActivationLine(23e-3, 20+273, 50, tau0, shape, 'k:');
        [vv, Tcc, hh] = DrawAfActivationLine(72e-3, 20+273, 50, tau0, shape, 'k:'); 
        text(2.3e1, 310, '23 mT', 'Rotation', -44, 'FontSize', fs);
        text(2.1e1, 570, '100°C, 100ka', 'Rotation', -65, 'FontSize', fs);
        text(7.0e1, 305, '72 mT', 'Rotation', -10, 'FontSize', fs);
    
    elseif scenario_number == 98
        [vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k--', 3);
        [vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k-', 2);        
        [vv, Tcc, hh] = DrawAfActivationLine(20e-3, 20+273, 50, tau0, shape, 'k:');
        [vv, Tcc, hh] = DrawAfActivationLine(50e-3, 20+273, 50, tau0, shape, 'k:');
        text(18, 570, '100°C, 1 h', 'Rotation', -65, 'FontSize', fs);
        text(6.7e1, 250, '50 mT', 'Rotation', -10, 'FontSize', fs);
        text(2.6e1, 280, '20 mT', 'Rotation', -45, 'FontSize', fs);
        text(5.0e1, 450, 'ChRM', 'FontSize', fs2);
        text(1.3e1, 150, 'pTRM', 'FontSize', fs2);
        
%         text(15, 490, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(82, 110, '\uparrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
%         text(45, 270, '\rightarrow', 'FontSize', 20, 'FontWeight', 'bold', 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
    elseif scenario_number == 109
        [vv, Tcc, hh] = DrawAfActivationLine(23e-3, 20+273, 50, tau0, shape, 'k-');
        [vv, Tcc, hh] = DrawAfActivationLine(72e-3, 20+273, 50, tau0, shape, 'k-'); 
        [vv, Tcc, hh] = DrawActivationLine(100+273, 100e3*yr, tau0, shape, 'k--');
        text(2.7e1, 280, '23 mT', 'Rotation', -44);
        text(2.05e1, 570, '100°C, 100ka', 'Rotation', -65);
        text(3.7e1, 360, '72 mT', 'Rotation', -24);
    end
end