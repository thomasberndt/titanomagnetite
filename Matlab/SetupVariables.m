function [V, Tc, mr, yr] = SetupVariables()
    global useGpu; 
    useGpu = 0; 
    
    Vstep = 1000;
    Tcstep = 200;
    
    [V, Tc] = meshgrid(logspace(log10(5e-9^3), log10(100e-9^3),Vstep), ...
                       linspace(580+273, 20+273, Tcstep));
                   
%     [V, Tc] = meshgrid(logspace(log10(5e-9^3), log10(200e-9^3),Vstep), ...
%                        [580+273 250+273]);
                   
    if useGpu
        V = gpuArray(V);
        Tc = gpuArray(Tc);
        mr = zeros(size(V,1), size(V,2), 2, 'gpuArray');
    else
        mr = zeros(size(V,1), size(V,2), 2);
    end
    yr = 3600*24*365.25;
end