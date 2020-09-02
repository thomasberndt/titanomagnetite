function PlotMsCurve(scenario_number, scenario_description, f, V, Tc, T)

    fh = figure(1); 
    set(fh, 'Position', [100, 100, 500, 500]);
    clf
    
    Ms = MsCurve(f, V, Tc, T); 
    
    
    plot(T-273, Ms, 'k-'); 
    title('M_s(T)'); 
    xlabel('T [C]'); 
    ylabel('M_s(T) [Am^2]'); 
    grid on
    hold on
    
    
    f = fit(T', Ms,  'smoothingspline', 'SmoothingParam', 1e-5);
    [~, M2] = differentiate(f, T);
    [~,pks] = findpeaks(M2);
    if ~isempty(pks)
        pks = pks + 1;    
        for n = 1:length(pks)
            mM = min(max(Ms(pks(n))*2,0.2*max(Ms)), max(Ms)); 
            plot([T(pks(n)), T(pks(n))]-273, [0, mM], 'Color', [0.6,0.6,0.6]); 
            fprintf('T_C: %3u C\n', round(T(pks(n)))-273); 
        end
    end
        
    legend('M_s(T)', 'T_C'); 
    
    
    if scenario_number == 46
        text(T(pks(1))-273, Ms(pks(1)), 'TM60', 'Rotation', 90, 'VerticalAlignment', 'Top'); 
%         text(T(pks(2))-273, Ms(pks(2)), 'Magnetite', 'Rotation', 90, 'VerticalAlignment', 'Top'); 
    end
    
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Ms\\Ms %03d. %s.png',scenario_number, scenario_description), 'png');
    saveas(gcf, sprintf('..\\Output\\Ms\\Ms %03d.eps',scenario_number), 'epsc');

end