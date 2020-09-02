function M = MeasureNRM(mr, Tc, f, V)
    Ms0 = CalculateMs0(Tc); 
    if size(mr,3) > 1
        M = [sum(sum(Ms0.*mr(:,:,1).*f.*V)); ...
             sum(sum(Ms0.*mr(:,:,2).*f.*V))]; 
    else
        M = sum(sum(Ms0.*mr(:,:).*f.*V)); 
    end
end