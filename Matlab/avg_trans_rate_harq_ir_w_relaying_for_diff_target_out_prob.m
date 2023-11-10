% Define the fixed rate R1 for each HARQ round
R1_with_relay = [0.25, 1.05]; % Assuming these are the rates when e = 0.01 for M = 2 and M = 4 with relaying
R1_without_relay = [0.1, 0.55]; % Assuming these are the rates when e = 0.01 for M = 2 and M = 4 without relaying

% Define the target outage probabilities
e_values = [0.1, 0.01]; % Target outage probabilities

% Define the SNR range for plotting (in dB)
snr_dB_range = 0:1:10; % SNR range from 0 dB to 20 dB
snr_linear = 10.^(snr_dB_range / 10); % Convert SNR from dB to linear scale

% Placeholder for the average transmission rate calculation
% The actual calculation will depend on the specific HARQ system model used
% and should be derived from the equations in your paper
avg_rate_with_relay_M2 = R1_with_relay(1) ./ expected_transmissions(snr_linear, e_values(1), 'with_relay', 2);
avg_rate_with_relay_M4 = R1_with_relay(2) ./ expected_transmissions(snr_linear, e_values(2), 'with_relay', 4);
avg_rate_without_relay_M2 = R1_without_relay(1) ./ expected_transmissions(snr_linear, e_values(1), 'without_relay', 2);
avg_rate_without_relay_M4 = R1_without_relay(2) ./ expected_transmissions(snr_linear, e_values(2), 'without_relay', 4);

% Plot the average transmission rates vs SNR
figure;
plot(snr_dB_range, avg_rate_with_relay_M2, 'b-', 'LineWidth', 2);
hold on;
plot(snr_dB_range, avg_rate_with_relay_M4, 'b--', 'LineWidth', 2);
plot(snr_dB_range, avg_rate_without_relay_M2, 'r-', 'LineWidth', 2);
plot(snr_dB_range, avg_rate_without_relay_M4, 'r--', 'LineWidth', 2);
hold off;

% Customize plot properties
grid on;
legend('With Relaying, M=2, e=0.1', 'With Relaying, M=4, e=0.01', 'Without Relaying, M=2, e=0.1', 'Without Relaying, M=4, e=0.01');
xlabel('Transmit SNR ρ (dB)');
ylabel('Average Transmission Rate R (bps/Hz)');
title('Average Transmission Rate vs. SNR for HARQ-IR with Different Outage Probabilities');

% Placeholder function for expected number of transmissions
function N = expected_transmissions(snr, e, relaying, M)
    % Actual transmission count will depend on the outage probability,
    % relay usage, and SNR. Placeholder below for demonstration purposes.
    if strcmp(relaying, 'with_relay')
        N = log(1/e) * snr; % Simplified placeholder logic
    else
        N = log(1/e) * snr * 0.5; % Assume non-relaying is less efficient
    end
end
