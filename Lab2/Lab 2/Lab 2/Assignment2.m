close all; clear all; clc
fs = 44000; %44 KHz

[y1,fs] = audioread("vowel1.wav");
[y2,fs] = audioread("vowel2.wav");

figure();
t = (0:length(y1)-1)/fs;
t=linspace(0,length(y1)/fs,length(y1));
plot(t,y1)

%figure();
% periodogram(y1,rectwin(length(y1)),length(y1),fs);
figure();
subplot(3,2,1)
[p1,Fs]= pwelch(y1,rectwin(3e-3*fs),0,256,fs);
plot(Fs,20*log10(p1))
title("F1, Welch's method, Rechtangular window length: 3ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')
%hold on
%figure();

subplot(3,2,3)
[p2,Fs]= pwelch(y1,rectwin(40e-3*fs),0,256,fs);
plot(Fs,20*log10(p2))
title("Y1 Welch's method Rechtangular window length: 40ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')
%hold on

subplot(3,2,5)
%figure();
[p3,Fs]= pwelch(y1,rectwin(600e-3*fs),0,256,fs);
plot(Fs,20*log10(p3))
title("Y1 Welch's method Rechtangular window length: 600ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')

subplot(3,2,2)
[p4,Fs]= pwelch(y2,rectwin(3e-3*fs),0,256,fs);
plot(Fs,20*log10(p4))
title("Y1 Welch's method Rechtangular window length: 3ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')
%hold on
%figure();

subplot(3,2,4)
[p5,Fs]= pwelch(y2,rectwin(40e-3*fs),0,256,fs);
plot(Fs,20*log10(p5))
title(" Welch's method Rechtangular window length: 40ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')
%hold on

subplot(3,2,6)
%figure();
[p6,Fs]= pwelch(y2,rectwin(600e-3*fs),0,256,fs);
plot(Fs,20*log10(p6))
title("F2, Welch's method Rechtangular window length: 600ms")
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude (dB)')
