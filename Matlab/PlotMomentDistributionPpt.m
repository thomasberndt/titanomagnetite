function PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape)
    Ms0 = CalculateMs0(Tc);
    fh = figure(1);
    set(fh, 'Position', [100, 100, 700, 700]);
    clf
    
    lw = 1;
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
     contour(V.^(1/3)/1e-9, Tc-273, real(m2), c, 'k-', 'LineWidth', lw); 
%     colorbar
%     xlabel('Volume [nm]'); 
%     ylabel('T_c [C]'); 
    set(gca,'xscale','log')
    grid on
    xlim([1e1 1e2])
    ax = gca; 
    ax.XAxis.TickValues = 10:10:100;
    
%     grid off 
    
end