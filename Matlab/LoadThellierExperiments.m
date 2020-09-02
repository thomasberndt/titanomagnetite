function [NRMs, pTRMs, Ts, scenario_numbers, scenario_descriptions] = LoadThellierExperiments()


    NRMs = cell(4,4);
    pTRMs = cell(4,4);
    Ts = cell(4,4);
    scenario_numbers = zeros(4,4);
    scenario_descriptions = cell(4,4);

    for n = 1:4
        for k = 1:4
            scenario_number = 530 + k + 4*(n-1); 
            load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
            NRMs{k,n} = NRM; 
            pTRMs{k,n} = pTRM; 
            Ts{k,n} = T;
            scenario_numbers(k,n) = scenario_number; 
            scenario_descriptions{k,n} = scenario_description;
        end
    end

end