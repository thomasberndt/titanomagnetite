function ZijderveldLabel(M, T, labels)
    ax = axis;
    wid = ax(2)-ax(1);
    w = wid * 0.02 *sin(-pi/4);
    h = wid * 0.02 *cos(-pi/4); 
    for n = 1:length(labels)
        id = find(T>=labels(n) & ~isnan(M(:,1)) & ~isnan(M(:,2)), 1, 'first');
        if mod(n,2) == 0 || size(M, 2) < 3
            text(M(id,2)-w, M(id,1)-h, strcat(' ', num2str(labels(n))), 'Rotation',-45, 'FontSize', 14); 
        else
            text(M(id,2)-w, M(id,3)-h, strcat(' ', num2str(labels(n))), 'Rotation',-45, 'FontSize', 14); 
        end
    end
    
end