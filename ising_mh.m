function Mvals = ising_mh(L, T, steps)
    % L: lattice size (L x L)
    % T: temperature
    % steps: number of MH iterations
    
    beta = 1 / T;
    
    % spins: ±1
    spins = randi(2, L, L) * 2 - 3;  % random ±1
    
    Mvals = zeros(floor(steps/100),1);
    idx = 1;

    for s = 1:steps
        
        % pick random site
        i = randi(L);
        j = randi(L);
        
        % compute ΔE for flipping (i,j)
        dE = delta_energy(spins, i, j, L);
        
        % MH accept
        if dE <= 0 || rand < exp(-beta * dE)
            spins(i,j) = -spins(i,j);
        end
        
        % record magnetisation periodically
        if mod(s, 100) == 0
            Mvals(idx) = mean(spins(:));
            idx = idx + 1;
        end
    end
end

