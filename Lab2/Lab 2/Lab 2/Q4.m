close all; clear all; clc;

r = load("radar.mat");
range  = r.range;
data = r.Data_out;


% === 2. PLOT === 
Ts = 1e-3; % -- given, sampling time interval 
slow_time = (1:size(r.Data_out)*Ts); % -- given 

% make you plot here with imagesc 
show = abs(data(slow_time));


%surf(10*log10(abs(data)))
%hold on
imagesc(abs(10*log10(data(slow_time,:))));


figure()
% === 3. RDM === 
N_doppler = 512; % -- this line is given 
freq = (-500:1000/(N_doppler+1):500);  % -- this line is given
fft_data = 10*log10(abs(fft(data(1:N_doppler+2,:))));

stem(trans(freq),fft_data(1:N_doppler+1,:))

s = 3;
% make your plot here 


