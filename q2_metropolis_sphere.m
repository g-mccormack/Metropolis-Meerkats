function samples = q2_metropolis_sphere(step)

    N       = 100000;     
    burnin  = 10000;           
    
    x = zeros(N,3);       
    x(1,:) = [1 0 0];

    accept = 0;

    for n = 2:N
        proposal = x(n-1,:) + step*randn(1,3);

        proposal = proposal ./ norm(proposal);

        alpha = 1;

        if rand < alpha
            x(n,:) = proposal;
            accept = accept + 1;
        else
            x(n,:) = x(n-1,:);
        end
    end
	
    samples = x(burnin+1:end,:);

    
	%% Plot: trajectory on sphere (first 5000 steps)
    %figure;
    %plot3(x(1:5000,1), x(1:5000,2), x(1:5000,3), '.');
    %xlabel('x'); ylabel('y'); zlabel('z');
    %title('MH on the sphere (first 5000 points)');
    %axis equal;
    %grid on;

    %% Plot: scatter of final samples
    %figure;
    %scatter3(samples(:,1), samples(:,2), samples(:,3), 5, 'filled');
    %xlabel('x'); ylabel('y'); zlabel('z');
    %title('Samples on sphere (after burn-in)');
    %axis equal;
    %grid on;

end
