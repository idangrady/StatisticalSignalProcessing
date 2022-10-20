close all; clear; clc;

w0 = pi;
N = 1000;
T = 100*pi;                % total time
t = linspace(0,T,N+1);   % N+1 points, N intervals

x = cos(t*w0);
fftxabs = abs(fft(x));

deltw = 2*pi /T;
w = (-N/2:N/2)*deltw;

figure;
stem(w,fftxabs)
figure;
stem(abs(fft(cos(t*(w0*2)))))

%%
x = linspace(0,10,10+1);
conv(x,x);

%%
L = 64;

x = linspace(0,100,100+1);

Wn = 0.58 - 0.5*cos(2*pi*x/(L-1)) + 0.5*cos(4*x*pi/(L-1));
fftWn = fft(Wn);
stem(Wn)
figure;
stem(abs(fftWn))
wvtool(blackman(L))

%%
min(0.5*cos(2*pi*x/(L-1)))+ 0.5
min(0.5*cos(4*x*pi/(L-1))) + 0.5

%%
x1 = cos(pi*t);% +randn(size(n));
fftX = fftshift(x1/N);

Nx = length(x1);
nsc = floor(Nx/4.5);
% to estimate the psd

delw = 2*pi/T;
w = (-N/2:N/2-1)*delw;
r = [real(fftX);imag(fftX)];
stem(w,[real(fftX);imag(fftX)]')

figure; plot(abs(fftX)/length(t));



figure;
pwelch(x1,hanning(nsc),0.4)

%%
w0 = pi;
T = 100*pi;                % total time
N = 1000;
t = linspace(0,T,N+1);   % N+1 points, N intervals
t(end) = [];             % eliminate repeated point at the end
y = cos(w0*t);
z = fftshift(fft(y)/N);
% fft golden rule: delta_t*delta_w = 2*pi/N
% delta_w = 2*pi/(N*delta_t) = 2*pi/T
delw = 2*pi/T;
w = (-N/2:N/2-1)*delw;
r = [real(z);imag(z)];
stem(w,[real(z);imag(z)]')
xlim([-10 10])