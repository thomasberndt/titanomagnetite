function PlotMagnetizationDistribution(scenario_number, scenario_description, mr, V, Tc)

    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    
    maxMr = max(mr(:)); 
    if maxMr == 0
        c = 0;
    else
        c = linspace(log10(maxMr)-2, log10(maxMr),10); 
    end
    
    contourf(V.^(1/3)/1e-9, Tc-273, real(log10(mr(:,:,1))), c); 
    colormap(flipud(colormap('gray')));
%     colorbar
    xlabel('Volume [nm]'); 
    ylabel('T_c [C]'); 
    title('M_r(V,T_c)  vertical axis'); 
    set(gca,'xscale','log')
    grid on
    xlim([0.99e1 1e2])
    grid minor 
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\MagnetizationX\\Magnetization X %03d. %s.png',scenario_number, scenario_description), 'png');
    saveas(gcf, sprintf('..\\Output\\MagnetizationX\\Magnetization X %03d.eps',scenario_number), 'epsc');

    
    
    
    
    contourf(V.^(1/3)/1e-9, Tc-273, real(log10(mr(:,:,2))), c); 
    colormap(flipud(colormap('gray')));
%     colorbar
    xlabel('Volume [nm]'); 
    ylabel('T_c [C]'); 
    title('M_r(V,T_c)  horizontal axis'); 
    set(gca,'xscale','log')
    grid on
    xlim([0.99e1 1e2])
    grid minor 
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\MagnetizationY\\Magnetization Y %03d. %s.png',scenario_number, scenario_description), 'png');
    saveas(gcf, sprintf('..\\Output\\MagnetizationY\\Magnetization Y %03d.eps',scenario_number), 'epsc');

    
end