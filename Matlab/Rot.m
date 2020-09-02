function H2 = Rot(H1, phi)
    Phi = phi/180*pi; 
    rot = [cos(Phi), -sin(Phi); sin(Phi), cos(Phi)]; 
    H2 = rot*H1;
end