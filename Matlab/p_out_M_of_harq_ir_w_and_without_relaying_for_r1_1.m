% Define the target outage probability e and corresponding R1 rates for different HARQ scenarios
e = 0.01; % Fixed target outage probability
rates_M2 = [0.1, 0.25]; % Rates for HARQ without and with relaying when M=2
rates_M4 = [0.55, 1.05]; % Rates for HARQ without and with relaying when M=4

% Define the SNR range for plotting (in dB)
snr_dB_range = 0:1:10; % SNR values from 0 to 10 dB
snr_linear = 10.^(snr_dB_range / 10); % Convert SNR from dB to linear scale

% Initialize outage probability arrays for each scenario
Pout_M2_no_relay = zeros(length(snr_dB_range), 1);
Pout_M2_with_relay = zeros(length(snr_dB_range), 1);
Pout_M4_no_relay = zeros(length(snr_dB_range), 1);
Pout_M4_with_relay = zeros(length(snr_dB_range), 1);

% Calculate outage probabilities for each SNR point and scenario
for i = 1:length(snr_dB_range)
    % HARQ-IR without relaying, M=2
    Pout_M2_no_relay(i) = calculate_outage_probability(snr_linear(i), rates_M2(1), 2, false);
    
    % HARQ-IR with relaying, M=2
    Pout_M2_with_relay(i) = calculate_outage_probability(snr_linear(i), rates_M2(2), 2, true);
    
    % HARQ-IR without relaying, M=4
    Pout_M4_no_relay(i) = calculate_outage_probability(snr_linear(i), rates_M4(1), 4, false);
    
    % HARQ-IR with relaying, M=4
    Pout_M4_with_relay(i) = calculate_outage_probability(snr_linear(i), rates_M4(2), 4, true);
end

% Plot the outage probabilities
figure;
plot(snr_dB_range, Pout_M2_no_relay, 'b-', 'DisplayName', 'HARQ-IR M=2 No Relaying');
hold on;
plot(snr_dB_range, Pout_M2_with_relay, 'b--', 'DisplayName', 'HARQ-IR M=2 With Relaying');
plot(snr_dB_range, Pout_M4_no_relay, 'r-', 'DisplayName', 'HARQ-IR M=4 No Relaying');
plot(snr_dB_range, Pout_M4_with_relay, 'r--', 'DisplayName', 'HARQ-IR M=4 With Relaying');
hold off;

% Customize the plot with grid, legend, and labels
grid on;
legend('show');
xlabel('Transmit SNR ρ (dB)');
ylabel('Outage Probability P_{out}(M)');
title('Outage Probability for HARQ-IR under Various Scenarios');

% Function to calculate the outage probability based on SNR and rate for HARQ-IR
function Pout = calculate_outage_probability(snr, R1, M, with_relaying)
    % Placeholder for actual outage probability calculation
    % Here you would use the actual equations from your paper to compute Pout
    % The following is a simple exponential model for illustration only
    gamma_SNR = snr / (2^(R1) - 1); % Simplified SNR to gamma conversion
    if with_relaying
        % Assume some improvement factor for relaying, e.g., relaying improves SNR
        gamma_SNR = gamma_SNR * 1.5; % This is just a placeholder
    end
    % Simplified outage probability calculation as an example
    Pout = 1 - exp(-1 / gamma_SNR) ^ M;
end
