steps = [0.1,0.5,5.0];

figure;hold on; grid on;

for s = 1:length(steps)
    samples = q2_metropolis_sphere(steps(s));
    f = samples(:,1);    
    
    x = f - mean(f);
    
    % choose max lag
    maxlag = 500;
    
    rho = zeros(maxlag,1);
    
    for k = 1:maxlag
        rho(k) = (x(1:end-k)' * x(1+k:end)) / ( (length(x)-k) * var(x) );
    end
    plot(1:maxlag, rho, 'DisplayName', sprintf('step = %.2f', steps(s)));

end

xlabel('Lag k');
ylabel('\rho(k)');
title('Autocorrelation function for Sphere MH chain with varying step');
legend;