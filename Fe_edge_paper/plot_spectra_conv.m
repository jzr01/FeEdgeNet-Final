close all;
figure;
hold on;
box on;
thickness_list = 2:5;
for j = 1:4

    %add noise 
    y = X_test_noise(:,:,:,3);
   

    thickness = thickness_list(j);
    fwhm_zlp = 0.01;
    fwhm_loren = 0.3;
    [~, f] = pluralKernel_Gaussian(thickness,fwhm_zlp,fwhm_loren);
    indzero = find(f==max(f));
    yconv = conv(y,f);
    N = length(y);   
    yconv = circshift(yconv,-indzero);
    yconv = yconv(1:N);
    yconv  = (yconv - mean(yconv))/std(yconv);
    y = yconv(1:N);
    y = y - min(y);
    y = y /max(y);
    plot(en1,y);
end
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 730],'ylim',[0 1],'FontSize',20)
yticks([])
set(gcf,'position',[400,400,400,800])
legend("thickness = 1","thickness = 0","thickness = 0","thickness = 0")
%exportgraphics(gcf,'snr_spectra.png','Resolution',2400)