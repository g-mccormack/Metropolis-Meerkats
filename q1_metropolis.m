function samples = q1_metropolis(sigma)
   
    N       = 100000;  
    burnin  = 10000;    

    x = zeros(N,1);
    x(1) = 0.5;         

    target = @(z) exp(-5*(z-0.5).^2) .* cos(3*pi*z) + 1;

    accept = 0;

    for n = 2:N
        proposal = x(n-1) + sigma*randn;

        if proposal < 0 || proposal > 1
            x(n) = x(n-1);
            continue
        end
        alpha = min(1, target(proposal) / target(x(n-1)));

        if rand < alpha
            x(n) = proposal;
            accept = accept + 1;
        else
            x(n) = x(n-1);
        end
    end

    samples = x(burnin+1:end);
end