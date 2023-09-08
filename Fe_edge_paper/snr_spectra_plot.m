close all;
figure;
hold on;
box on;
noise_list = [5 10 20 30];
for j = 1:4

    %add noise 
    y = X_test_noise(:,:,:,1);
    y = y +1;
   
    snr = noise_list(j);

    sd =  mean(y)/snr;

    %white noise
    whitenoise=  random('normal',0,sd,1,length(y)); 
    a = y + whitenoise;
    a = a -mean(a);
    a = a/max(a);
    plot(en1,a+0.5*(j-1),'LineWidth',1.5)

end
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 735],'ylim',[-0.6 2.6],'FontSize',20)
yticks([])
set(gcf,'position',[400,400,400,800])
legend("SNR = 5","SNR = 10","SNR = 20","SNR = 30")
exportgraphics(gcf,'snr_spectra.png','Resolution',2400)