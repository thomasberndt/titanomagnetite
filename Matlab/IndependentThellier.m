function [NRM, pTRM, m, b] = IndependentThellier(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape, H0_lab, t_lab, T)

    
    NRM = NaN * zeros(1, length(T)); 
    pTRM = NaN * zeros(1, length(T));
    

    fhT = figure(2); 
    set(fhT, 'Position', [100, 500, 500, 500]);
    clf

    for n = 1:length(T)
        
        mr2 = AcquireVRM(mr, V, Tc, T(n), t_lab, [0; 0], tau0, shape); 
        nrm = MeasureNRM(mr2, Tc, f, V); 
        nrm = nrm(1); 
        NRM(n) = nrm; 
        
        
        PlotMomentDistributionX(scenario_number, scenario_description, ...
                                f, mr2, V, Tc);
        drawnow

        mr2 = AcquireVRM(mr2, V, Tc, T(n), t_lab, H0_lab, tau0, shape); 
        mr2 = AcquireTRM(mr2, V, Tc, 20+273, T(n), (T(n)-20-273), H0_lab, tau0, shape); 
        mr2 = AcquireVRM(mr2, V, Tc, 20+273, 1, [0; 0], tau0, shape); 
        ptrm = MeasureNRM(mr2, Tc, f, V); 
        ptrm = ptrm(1) - nrm;
        pTRM(n) = ptrm; 
        
        figure(fhT);
        plot(pTRM, NRM, 'sk');
        maxax = max(max(pTRM),max(NRM));
        xlim([0, maxax]);
        ylim([0, maxax]);
        xlabel('pTRM'); 
        ylabel('NRM');
        grid on
        grid minor

        drawnow
        
        PlotMomentDistributionX(scenario_number, scenario_description, ...
                                f, mr, V, Tc);
        drawnow
    end


    figure(fhT);
    title('Thellier-Thellier');
    
    %%
    
    clf
    plot(pTRM, NRM, 'sk'); 
    hold on
    maxax = max(max(pTRM),max(NRM));
    xlim([0, maxax*1.1]);
    ylim([0, maxax*1.1]);
    xlabel('pTRM'); 
    ylabel('NRM');
    grid on
    grid minor
        
    id = logical(T<999150+273); 
    p = polyfit(NRM(id), pTRM(id), 1); 
    m = p(1);
    b = p(2); 
    
    nrm_fit = linspace(0, maxax); 
    ptrm_fit = m.*nrm_fit + b; 
    
    hold on 
    plot(ptrm_fit, nrm_fit, 'k-');
    
%     
%     id = logical(T>210+273); 
%     p = polyfit(NRM(id), pTRM(id), 1); 
%     m = p(1);
%     b = p(2); 
%     
%     nrm_fit = linspace(0, maxax); 
%     ptrm_fit = m.*nrm_fit + b; 
%     
%     hold on 
%     plot(ptrm_fit, nrm_fit, 'k-');
    
    for n = 1:length(T)
        text(pTRM(n) + 0.02*maxax, NRM(n), num2str(T(n)-273));
    end
    
    %%
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier %03d. %s.png', scenario_number, scenario_description), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier %03d.eps', scenario_number), 'epsc'); 




end