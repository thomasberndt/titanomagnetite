

[NRMs, pTRMs, Ts, scenario_numbers, scenario_descriptions] = LoadThellierExperiments();


fhT = figure(1); 
set(fhT, 'Position', [100, 200, 500, 500]);
clf

symbols = {'s','o','d','v'}; 
colors = {'k', 'r', 'b', 'm'}; 

all_ind = [1 4 2 3];

for n = 1:4
    fhT = figure(n);
    set(fhT, 'Position', [100, 200, 500, 500]);
    clf
    
    for k = all_ind
        ma = max(pTRMs{k,n});
        plot(pTRMs{k,n}/ma, NRMs{k,n}/ma, [symbols{k}, 'k-'], 'MarkerFaceColor', 'w');
        fprintf('%s%s: %d: %s\n', symbols{n}, colors{k}, scenario_numbers(k,n), scenario_descriptions{k,n});
        hold on;
    end
    
    legend('TRM 100 ka', 'TRM 100 ka Newtonian', 'TRM 1h', 'TRM 1h+VRM 100 ka');
    maxax = 1.6; %max(max(pTRM),max(NRM));
    xlim([0, maxax]);
    ylim([0, maxax]);
    xlabel('pTRM'); 
    ylabel('NRM');
    grid on
    
    
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier Four %03d. %s.png', scenario_numbers(k,n), scenario_descriptions{k,n}), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier Four %03d.eps', scenario_numbers(k,n)), 'epsc'); 



end

%%

for n = 1:4
    fhT = figure(n+5);
    set(fhT, 'Position', [100, 200, 500, 500]);
    clf
    
    for k = all_ind
        dThellier = -diff(NRMs{k,n}) ./ diff(pTRMs{k,n} );
        plot(Ts{k,n}(1:end-1)-273, dThellier, [symbols{k}, 'k-'], 'MarkerFaceColor', 'w');
        fprintf('%s%s: %d: %s\n', symbols{n}, colors{k}, scenario_numbers(k,n), scenario_descriptions{k,n});
        hold on;
    end
    
    legend('TRM 100 ka', 'TRM 100 ka Newtonian', 'TRM 1h', 'TRM 1h+VRM 100 ka');
    xlabel('T'); 
    ylabel('-dM_{NRM}/dM_{pTRM}');
    grid on
    axis([0 500 0.9 1.8]);
    
    
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier Slope %03d. %s.png', scenario_numbers(k,n), scenario_descriptions{k,n}), 'png'); 
    saveas(gcf, sprintf('..\\Output\\Thellier\\Thellier Slope %03d.eps', scenario_numbers(k,n)), 'epsc'); 



    
end
    
