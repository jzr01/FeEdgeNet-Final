close all;

color = {'#0072BD',"#D95319"};
figure
box on;
hold on;
data = Fe2_normalize;
num = 0;

for i=13
    num = num + 1;
    x = data(i).x;
    y = data(i).y;
    y = normalize(y,"range");
    plot(x,y+0.6*(num-1),'LineWidth',2,Color=color{1});
end
data = Fe3_normalize;
for j=17
    num = num + 1;
    x = data(i).x;
    y = data(i).y;
    y = normalize(y,"range");
    plot(x,y+0.6*(num-1),'LineWidth',2,Color=color{2});

end
title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 735],'ylim',[-0.05 0.6*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[400,400,400,800])
exportgraphics(gcf,data(j).group+".png",'Resolution',800)