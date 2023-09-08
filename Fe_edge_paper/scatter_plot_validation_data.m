close all;
ind = randperm(length(X_Validation),1000);
X_V2 = predict(cnn1,X_Validation(:,:,:,ind));
Y_V2 = Y_Validation(:,:,:,ind);
Y_V2 = reshape(Y_V2,1000,1);
figure;
hold on;
box on;
scatter(X_V2',Y_V2',5,'filled');
plot(0:0.1:1,0:0.1:1,'LineWidth',1.5,'Color','#D95319');
plot(0.1:0.1:1,0:0.1:0.9,'--','LineWidth',1.5,'Color','#D95319');
plot(0:0.1:0.9,0.1:0.1:1,'--','LineWidth',1.5,'Color','#D95319');
xlabel('Predict Ratio of Fe^{2+}') 
ylabel('True Ratio of Fe^{2+}') 
ylim([-0.02, 1.02])
xlim([-0.02 1.02])
set(gca,'FontSize',13,'Linewidth',1.5,'FontWeight','bold');
exportgraphics(gcf,'Validation scatter.png','Resolution',2400)