function [d2f, x2, y2] = MixedDerivative(f, x, y)
    d2f = diff(diff(f, 1, 1), 1, 2)./diff(x(1:end-1,:), 1, 2)./diff(y(:,1:end-1), 1, 1); 
    x2 = x(1:end-1,1:end-1);
    y2 = y(1:end-1,1:end-1); 
end