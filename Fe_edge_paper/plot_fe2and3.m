close all;
data = Fe_combine_data;
figure;
box on;
hold on;
plot(data(6).x2,data(6).y2/max(data(6).y2),LineWidth=3);
plot(data(6).x3,data(6).y3/max(data(6).y2),LineWidth=3);
xline(700:5:735,'--');
ylim([-0.2 1.4])
xlim([700 735])
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'XTick',700:5:735,'YTick',[0:0.3:1.2]);
text(701.12,1,'Fe^{2+}\rightarrow','Fontsize',20,"FontWeight",'bold');
text(711.94,1.17,'\leftarrowFe^{3+}','Fontsize',20,"FontWeight",'bold');
text(710, 0 ,'L3','Fontsize',20,"FontWeight",'bold');
text(721, 0 ,'L2','Fontsize',20,"FontWeight",'bold');
exportgraphics(gcf,"Fe2+and3+.png",'Resolution',2400)