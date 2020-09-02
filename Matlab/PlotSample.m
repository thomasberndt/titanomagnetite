function PlotSample(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape)

    T = [20:3:580] + 273;
     PlotMsCurve(             scenario_number, scenario_description, f, V, Tc, T); 
    PlotMomentDistribution(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape); 
     PlotMomentDistributionX(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape); 
     PlotMomentDistributionY(scenario_number, scenario_description, f, mr, V, Tc, tau0, shape); 
     PlotZijderveldStepwise(  scenario_number, scenario_description, f, mr, V, Tc, T,   600, tau0, shape);
     PlotZijderveldContinuous(scenario_number, scenario_description, f, mr, V, Tc, T,  1000, tau0, shape);
     PlotZijderveldContinuousNormalized(scenario_number, scenario_description, f, mr, V, Tc, T,  1000, tau0, shape);
     PlotZijderveldAf(        scenario_number, scenario_description, f, mr, V, Tc, 20+273,  50, tau0, shape);

     PlotMagnetizationDistribution(scenario_number, scenario_description,    mr, V, Tc); 

end