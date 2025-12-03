function dE = delta_energy(spins, i, j, L)
    % periodic boundary conditions
    ip = mod(i, L) + 1;      % i+1
    im = mod(i-2, L) + 1;    % i-1
    jp = mod(j, L) + 1;
    jm = mod(j-2, L) + 1;
    
    s = spins(i,j);
    
    % sum of neighbor spins
    neigh = spins(im,j) + spins(ip,j) + spins(i,jm) + spins(i,jp);
    
    % energy difference
    dE = 2 * s * neigh;
end
