close all;


figure
box on;
hold on;
data = test_data;
num = 0;

for i=22:25
    num = num + 1;
    x = 695:0.02:735;
    y = data(i).data;
    y = normalize(y,"range");
    plot(x,y+0.6*(num-1),'LineWidth',2,Color="#77AC30");
end

title("Fe3O4",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 735],'ylim',[-0.05 0.6*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[400,400,400,800])
exportgraphics(gcf,"Fe3O4.png",'Resolution',800)