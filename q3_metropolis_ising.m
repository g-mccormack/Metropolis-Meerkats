function samples = q3_metropolis_ising(T)

    Nsteps  = 100000;   
    burnin  = 10000;    
    L       = 50;

    x = zeros(Nsteps, L);    
    spins = ones(1, L);
    
    energy = @(s) -sum(s .* circshift(s, -1));

    E = energy(spins);
    accept = 0;

    for n = 2:Nsteps
        i = randi(L);
        proposal = spins;
        proposal(i) = -proposal(i);
        Enew = energy(proposal);
        alpha = min(1, exp(-(Enew - E)/T));

        if rand < alpha
            spins = proposal;
            E = Enew;
            accept = accept + 1;
        end

        x(n,:) = spins;
    end
	
    %fprintf('Acceptance rate: %.2f%%\n', 100*accept/(Nsteps-1));

    samples = x(burnin+1:end,:);

    %% Plot 1: magnetisation trace (first 5000 steps)
    %mags = mean(x,2);
    %figure;
    %plot(1:5000, mags(1:5000));
    %xlabel('Iteration');
    %ylabel('Magnetisation');
    %title('Ising model MH chain (first 5000 steps)');

    %% Plot 2: histogram of magnetisation
    %figure;
    %histogram(mags(burnin+1:end), 30, 'Normalization', 'pdf');
    %xlabel('Magnetisation');
    %ylabel('Density');
    %title('Histogram of magnetisation (after burn-in)');
end