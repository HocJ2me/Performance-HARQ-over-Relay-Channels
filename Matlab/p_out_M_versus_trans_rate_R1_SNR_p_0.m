% Define the fixed transmit SNR value
snr_dB = 0; % SNR of 0 dB
snr = 10^(snr_dB/10); % Convert SNR from dB to linear scale

% Define a range of transmission rates R1
R1_range = 0:0.05:2; % Transmission rate from 0 to 2 bps/Hz in increments of 0.05 bps/Hz

% Initialize vectors to store the outage probability for each scenario
Pout_M2_no_relay = zeros(size(R1_range));
Pout_M2_with_relay = zeros(size(R1_range));
Pout_M4_no_relay = zeros(size(R1_range));
Pout_M4_with_relay = zeros(size(R1_range));

% Calculate outage probabilities for each transmission rate
for i = 1:length(R1_range)
    R1 = R1_range(i); % Current transmission rate
    
    % Calculate outage probabilities using the given rates for a target e = 0.01
    % Note: The actual functional relationship between Pout, R1, and SNR should be derived from your paper
    % The following calculations are placeholders and should be replaced with those relationships
    Pout_M2_no_relay(i) = calculate_pout(snr, R1, 2, false); % HARQ without relaying M=2
    Pout_M2_with_relay(i) = calculate_pout(snr, R1, 2, true);  % HARQ with relaying M=2
    Pout_M4_no_relay(i) = calculate_pout(snr, R1, 4, false); % HARQ without relaying M=4
    Pout_M4_with_relay(i) = calculate_pout(snr, R1, 4, true);  % HARQ with relaying M=4
end

% Plot the outage probability vs. transmission rate R1
figure;
plot(R1_range, Pout_M2_no_relay, 'b-', 'LineWidth', 2);
hold on;
plot(R1_range, Pout_M2_with_relay, 'r-', 'LineWidth', 2);
plot(R1_range, Pout_M4_no_relay, 'g-', 'LineWidth', 2);
plot(R1_range, Pout_M4_with_relay, 'k-', 'LineWidth', 2);
hold off;

% Customize the plot with grid, legend, and labels
grid on;
legend('HARQ without relaying M=2', 'HARQ with relaying M=2', 'HARQ without relaying M=4', 'HARQ with relaying M=4');
xlabel('Transmission rate R1 (bps/Hz)');
ylabel('Outage Probability P_{out}(M)');
title('Outage Probability vs. Transmission Rate for HARQ-IR at SNR = 0 dB');

% Placeholder function for calculating Pout
% Replace this with the actual calculation based on the paper's formulas
function Pout = calculate_pout(snr, R1, M, with_relaying)
    % Actual outage probability calculation goes here
    % The following is a simple model assuming outage probability increases with rate and decreases with SNR
    % This should be replaced with the exact relationship from the paper
    if with_relaying
        % Example adjustment for relaying
        gamma = snr * 1.5; % Assuming relaying improves the effective SNR by a factor
    else
        gamma = snr;
    end
    Pout = 1 - exp(-1/(gamma * (2^(R1*M) - 1)));
end
