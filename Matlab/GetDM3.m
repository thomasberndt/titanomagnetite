function [H3, M3] = GetDM3(H,M)
    N = length(M); 
    N2 = N/2+1;
    M2 = M(1:N/2)-M(end:-1:N2); 
    H2 = H(1:N/2); 
    H3 = H2(1:end/2);
    M3 = M2(1:end/2)+M2(end:-1:end/2+1);
    M3 = M3/4;
    dM3 = [diff(M3), 0]; 
end
    