
SetupConstants;

if exist('..\Temp\ScenariosGrainDistribution.mat', 'file')
    load('..\Temp\ScenariosGrainDistribution.mat', '-mat', 'f');
else
    f{1} = GrainDistribution(V, Tc, Inf, Inf, Inf);      % Homogeneous
    f{2} = GrainDistribution(V, Tc, Inf, 1e2, 1e1);      % No correlation, const Tc
    f{3} = GrainDistribution(V, Tc, Inf, 1e3, Inf);      % No correlation, Tc distribution
    f{4} = GrainDistribution(V, Tc, 5, 1e5, Inf);        % Tc and V distribution
    f{5} = GrainDistribution(V, Tc, Inf, Inf, 1e-1);     % Strong correlation
    f{6} = GrainDistribution(V, Tc, Inf, Inf, 1e1);      % Weak correlation
    f{7} = GrainDistribution(V, Tc, 1e3, 1e5, 1e0);      % Strong correlation and smooth distribution
    f{8} = GrainDistribution(V, Tc, 1e3, 1e5, 1e1);      % Weak correlation and smooth distribution
    f{9} = GrainDistribution(V, Tc, 1e3, 1e5, 5e-1);      % Weak correlation and smoother distribution
    f{10} = GrainDistribution(V, Tc, 1e0, Inf, Inf);        % No cor, V distribution


    f{11} = 1e8 * exp(-((log(V)-log(10e-9^3)).^2/3 + ...
                       (Tc-(580+273)).^2/1000)) + ...
            1e6 * exp(-((log(V)-log(40e-9^3)).^2/1 + ...
                       (Tc-(200+273)).^2/1000));
    f{11}(f{11}<1) = 0; 

    f{12} = 1e8 * exp(-((log(V)-log(10e-9^3)).^2/3 + ...
                       (Tc-(580+273)).^2/1000)) + ...
            1e6 * exp(-((log(V)-log(40e-9^3)).^2/1 + ...
                       (Tc-(350+273)).^2/1000));
    f{12}(f{12}<1) = 0; 

    f{1} = GrainDistribution(V, Tc, 1e3, 6e4, 1e0);      % Strong correlation and smooth distribution

    figure(1);
    for n = 1:length(f)
        clf
        PlotGrainDistribution(f{n}, V, Tc);
        saveas(gcf, sprintf('..\\Output\\GrainDistributions\\GrainDistributions%02d.png',n));        
    end
    
    save('..\Temp\ScenariosGrainDistribution.mat', 'f');
end



    