% Define the target outage probabilities and corresponding R1 rates for HARQ with relaying
e_values = [0.1, 0.01]; % e = 10^-1 and e = 10^-2
R1_values_M2 = [0.25, 1.05]; % R1 rates for M=2 and M=4 at e = 0.01 as given in the scenario
R1_values_M4 = [0.25, 1.05]; % R1 rates for M=2 and M=4 at e = 0.01 as given in the scenario

% Define the SNR range for plotting (in dB)
snr_dB_range = 0:1:10; % SNR range from 0 dB to 10 dB
snr_linear = 10.^(snr_dB_range / 10); % Convert SNR from dB to linear scale

% Placeholder matrices for the average number of transmissions for each M and e
N_transmissions_M2 = zeros(length(snr_dB_range), length(e_values));
N_transmissions_M4 = zeros(length(snr_dB_range), length(e_values));

% Compute the average number of transmissions based on the provided rates
for i = 1:length(e_values)
    for j = 1:length(snr_dB_range)
        N_transmissions_M2(j, i) = compute_avg_transmissions(R1_values_M2(i), snr_linear(j), e_values(i), 2);
        N_transmissions_M4(j, i) = compute_avg_transmissions(R1_values_M4(i), snr_linear(j), e_values(i), 4);
    end
end

% Plotting the results
figure;
plot(snr_dB_range, N_transmissions_M2(:, 1), 'b-', 'LineWidth', 2); % M=2, e=0.1
hold on;
plot(snr_dB_range, N_transmissions_M2(:, 2), 'b--', 'LineWidth', 2); % M=2, e=0.01
plot(snr_dB_range, N_transmissions_M4(:, 1), 'r-', 'LineWidth', 2); % M=4, e=0.1
plot(snr_dB_range, N_transmissions_M4(:, 2), 'r--', 'LineWidth', 2); % M=4, e=0.01
hold off;

% Customize the plot with grid, legend, and labels
grid on;
legend('M=2, e=0.1', 'M=2, e=0.01', 'M=4, e=0.1', 'M=4, e=0.01');
xlabel('Transmit SNR ρ (dB)');
ylabel('Average Number of Transmissions');
title('Average Number of Transmissions for HARQ-IR with Relaying');

% Function to compute the average number of transmissions based on rate R1, SNR, e, and HARQ rounds M
% Replace the body of this function with the appropriate calculations from the paper
function N = compute_avg_transmissions(R1, snr, e, M)
    % Example calculation using a hypothetical relationship
    % This should be replaced with the actual relationship from the paper
    % As the SNR increases, the expected number of transmissions might decrease due to better channel conditions
    % Here we use a simple inverse relationship for demonstration
    N = log(1/e) / (snr * R1 * M); % This is just a placeholder and not based on real equations
end
