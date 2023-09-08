close all;
X_test_conv = zeros(1,371,1,1000);    
thickness_list = [0 1 2 3];
ind = randperm(200000,1000);
for j = 1:4
        thickness = thickness_list(j);
        fwhm_zlp = 0.2;
        fwhm_loren = 0.2;
        [~, f] = pluralKernel_Gaussian(thickness,fwhm_zlp,fwhm_loren);
        indzero = find(f==max(f));
    for i = 1:1000

        y = X_test_noise(:,:,:,i);
        yconv = conv(y,f);
        N = length(y);   
        yconv = circshift(yconv,-indzero);
        yconv = yconv(1:N);
        yconv  = (yconv - mean(yconv))/std(yconv);
        X_test_conv(:,:,:,i) = yconv(1:N);
%         figure;
%         hold on;
%         plot(en1,X_test_noise(:,:,:,i));
%         plot(en1,X_test_conv(:,:,:,i));
    end
    figure;
    plot(en1,X_test_conv(:,:,:,i));
    Y_predict = predict(cnn1,X_test_conv);
    Y_test_conv = reshape(Y_test_noise,1000,1);

    figure;
    hold on;
    box on;
    scatter(Y_predict,Y_test_conv,5,'filled');
    plot(0:0.1:1,0:0.1:1,'LineWidth',1.5,'Color','#D95319');
    plot(0.1:0.1:1,0:0.1:0.9,'--','LineWidth',1.5,'Color','#D95319');
    plot(0:0.1:0.9,0.1:0.1:1,'--','LineWidth',1.5,'Color','#D95319');
    xlabel('Predict Ratio of Fe^{2+}') 
    ylabel('True Ratio of Fe^{2+}') 
    title("Thickness = "+string(thickness_list(j)))
    ylim([-0.02, 1.02])
    xlim([-0.02 1.02])
    set(gca,'FontSize',13,'Linewidth',1.5,'FontWeight','bold');
end