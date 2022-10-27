close all; clear all; clc;
%fs = 44000; %44 KHz

[y2,fs2] = audioread("vowel2.wav");
[y1,fs1] = audioread("vowel1.wav");

 model_orders = [100:400];

 var1 = zeros(length(model_orders),1);
 FPE1 = zeros(length(model_orders),1);
 AICc1 = zeros(length(model_orders),1);

 var2 = zeros(length(model_orders),1);
 FPE2 = zeros(length(model_orders),1);
 AICc2 = zeros(length(model_orders),1);

 % Vowel 1
 idx = 1;
 for modelOrder=100:400
     %Extract two criteria value (3-4 lines of code)
    [output1,var_curr_length] = lpc(y1,modelOrder);
    var1(idx)= var_curr_length;
     FPE1(idx) = var_curr_length*(fs1+idx)/(fs1-(idx));
     AICc1(idx) = fs1*(log(var_curr_length)) + 2*(idx) + (2*idx)*(idx+1)/(fs1-(idx)-1);


    [output2,var_curr_length] = lpc(y2,modelOrder);
    var2(idx)= var_curr_length;
     FPE2(idx) = var_curr_length*(fs2+idx)/(fs2-(idx));
     AICc2(idx) = fs2*(log(var_curr_length)) + 2*(idx) + (2*idx)*(idx+1)/(fs2-(idx)-1);
     idx=idx + 1;

 end

figure();
subplot(2,2,1)
plot(model_orders,FPE1)
[Ma,Ia] = min(FPE1);
tMin = model_orders(Ia);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', Ma, tMin);
text(tMin, Ma, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')
title('FPE Y1');
xline(tMin, 'Color', 'r', 'LineWidth', 2)
xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')

subplot(2,2,2)
plot(model_orders,AICc1)
[M,I] = min(AICc1);
tMin = model_orders(I);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', M, tMin);
text(tMin, M, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')
title('AIC Y1');
xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')


subplot(2,2,3)
plot(model_orders,FPE2)
[Ma,Ia] = min(FPE2);
tMin = model_orders(Ia);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', Ma, tMin);
text(tMin, Ma, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')
title('FPE Y2');
xline(tMin, 'Color', 'r', 'LineWidth', 2)
xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')

subplot(2,2,4)
plot(model_orders,AICc2)
[M,I] = min(AICc2);
tMin = model_orders(I);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', M, tMin);
text(tMin, M, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')
title('AIC Y2');
xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')

%%
close all; clear all; clc

[y1,fs] = audioread("vowel1.wav");
[y2,fs] = audioread("vowel2.wav");

 model_orders = [100:400];

 var = zeros(length(model_orders),1);
 FPE = zeros(length(model_orders),1);
 AICc = zeros(length(model_orders),1);
 
 % Vowel 1
 idx = 1;
 [output1,var_curr_length] = lpc(y2,145);

 figure(1);
freqz(1,output1,10,fs);
 figure(2);
 freqz(1,output1,100,fs);
 %%


close all; clear all; clc

[y1,fs] = audioread("vowel1.wav");
[y2,fs] = audioread("vowel2.wav");

 [output1,var_curr_length1] = lpc(y1,145);
 [output2,var_curr_length2] = lpc(y2,145);

 figure(1);
 subplot(2,2,1)
[h1, fs1] = freqz(1,output1,10,fs);
plot(fs1, mag2db(abs(h1)))
title("Y1 With b = 10")
xlabel('Frequency')
ylabel('Magnitude db')

subplot(2,2,2)
[h1, fs1] = freqz(1,output1,22000,fs);
plot(fs1, mag2db(abs(h1)))
title("Y1 With b = 22,000")
xlabel('Frequency')
ylabel('Magnitude db')

subplot(2,2,3)
[h2, fs2] = freqz(1,output2,10,fs);
plot(fs2, mag2db(abs(h2)))
title("Y2 With b = 10")
xlabel('Frequency')
ylabel('Magnitude db')

subplot(2,2,4)
[h2, fs2] = freqz(1,output2,22000,fs);
plot(fs2, mag2db(abs(h2)))
title("Y2 With b = 22,000")
xlabel('Frequency')
ylabel('Magnitude db')

%%
 subplot(2,2,2)
 freqz(1,output1,1000,fs);

subplot(2,2,3)
freqz(1,output2,10,fs);
 subplot(2,2,4)
 freqz(1,output2,1000,fs);
