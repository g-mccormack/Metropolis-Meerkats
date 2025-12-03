L = 20;
steps = 100000;
temps = [1.0, 2.0, 2.5, 3.5];

figure; hold on;

for k = 1:length(temps)
    T = temps(k);
    Mvals = ising_mh(L, T, steps);

    histogram(Mvals, 25, 'DisplayStyle', 'stairs', 'LineWidth', 1.5);
end

legend("T=1.0", "T=2.0", "T=2.5", "T=3.5");
xlabel("Magnetisation");
ylabel("Frequency");
title("Magnetisation Histograms for Different Temperatures");
