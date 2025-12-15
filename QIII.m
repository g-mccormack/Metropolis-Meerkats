T = [1.0,2.5,5.0];

figure;hold on; grid on;

for s = 1:length(T)
    samples = q3_metropolis_ising(T(s));
    f = samples(:);    
    
    x = f - mean(f);
    
    % choose max lag
    maxlag = 500;
    
    rho = zeros(maxlag,1);
    
    for k = 1:maxlag
        rho(k) = (x(1:end-k)' * x(1+k:end)) / ( (length(x)-k) * var(x) );
    end
    plot(1:maxlag, rho, 'DisplayName', sprintf('T = %.2f', T(s)));

end

xlabel('Lag k');
ylabel('\rho(k)');
title('Autocorrelation function for Ising MH chain with varying T');
legend;