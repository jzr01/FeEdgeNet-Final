close all
en = 695:0.1:740;
en1 = 698:0.1:735;
figure;
box on;
t_list = [1:1:4];
for i = 1:4
hold on;





thickness = t_list(i);
fwhm_zlp = 0.3;
fwhm_loren = 0.3;
[~, f] = pluralKernel_Gaussian(thickness,fwhm_zlp,fwhm_loren);


plot(-150:0.02:150,normalize(f,'range'),'LineWidth',2);



end
legend("Thickness = 1","Thickness = 2","Thickness = 3","Thickness = 4")
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[-5 60],'ylim',[-0.05 1.05],'FontSize',20)
yticks([0:0.5:1])
exportgraphics(gcf,"ZLP.png",'Resolution',2400)