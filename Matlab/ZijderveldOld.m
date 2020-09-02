function Zijderveld(M, T, line_h, line_v)
    if nargin < 3
        line_h = '.k'; 
        line_v = '.g'; 
    elseif nargin < 4
        line_v = line_h; 
    end
    h = ishold(); 
    plot(M(:,2), M(:,1), line_h)
    hold on 
    if (length(M(1,:)) == 3)
        plot(M(:,2), M(:,3), line_v)
    end
    
    grid on
    xlabel(''); 
    ylabel(''); 
    left = min(M(:,2));
    right = max(M(:,2)); 
    if size(M,2) < 3
        top = max(M(:,1));
        bottom = min(M(:,1)); 
    else
        top = max(max(M(:,1)), max(M(:,3))); 
        bottom = min(min(M(:,1)), min(M(:,3))); 
    end
    height = top - bottom; 
    width = right - left; 
    midX = (right+left) / 2; 
    midY = (top+bottom) / 2; 
    siz = max(height, width) * 1.1; 
    axis([midX - siz/2, midX + siz/2, midY - siz/2, midY + siz/2]);     
    if h
        hold on
    else 
        hold off
    end
end