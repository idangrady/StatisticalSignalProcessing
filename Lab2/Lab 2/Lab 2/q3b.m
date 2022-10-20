close all; clear all; clc
%fs = 44000; %44 KHz

[y2,fs] = audioread("vowel1.wav");
%t = (0:length(y1)-1)/fs;

 model_orders = [100:400];

 var = zeros(length(model_orders),1);
 FPE = zeros(length(model_orders),1);
 AICc = zeros(length(model_orders),1);
 
 % Vowel 1
 idx = 1;
 for modelOrder=100:400
     %Extract two criteria value (3-4 lines of code)
    [output,var_curr_length] = lpc(y2,modelOrder);
    var(idx)= var_curr_length;
    
     FPE(idx) = var_curr_length*(fs+idx)/(fs-(idx));
     AICc(idx) = fs*(log(var_curr_length)) + 2*(idx) + (2*idx)*(idx+1)/(fs-(idx)-1);
     idx=idx + 1;
 end
%figure();
%plot(model_orders,FPE)
figure();

%plot(model_orders,AICc)
figure();
subplot(2,1,1)
plot(model_orders,FPE)
[Ma,Ia] = min(FPE);
tMin = model_orders(Ia);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', Ma, tMin);
text(tMin, Ma, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')

xline(tMin, 'Color', 'r', 'LineWidth', 2)
xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')

 subplot(2,1,2)
plot(model_orders,AICc)
[M,I] = min(AICc);
tMin = model_orders(I);
xline(tMin, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Min of %.2f at t=%f', M, tMin);
text(tMin, M, textLabel, 'fontSize', 8, 'Color', 'r', 'VerticalAlignment','bottom')

xlabel('Model Order')
ylabel('Variance')
legend('AR estimation ')
%freqz(a)

%%
close all; clear all; clc
%fs = 44000; %44 KHz

[y2,fs] = audioread("vowel1.wav");
%t = (0:length(y1)-1)/fs;

 model_orders = [100:400];

 var = zeros(length(model_orders),1);
 FPE = zeros(length(model_orders),1);
 AICc = zeros(length(model_orders),1);
 
 % Vowel 1
 idx = 1;
 [output,var_curr_length] = lpc(y2,145);

 figure(1);
freqz(1,output,10,fs);
 figure(2);
 freqz(1,output,100,fs);
