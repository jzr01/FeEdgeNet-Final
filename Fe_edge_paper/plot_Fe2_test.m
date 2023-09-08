close all;

color1 = {"#0072BD", "#D95319"};

figure
box on;
hold on;
data = test_data;
num = 0;

for i=[3 4 11:14]
    num = num + 1;
    x = 695:0.02:735;
    y = data(i).data;
    y = normalize(y,"range");
    if abs(data(i).truth - data(i).cnn) <= 0.1
        c = color1{1};
    else
        c = color1{2};
    end
    plot(x,y+0.6*(num-1),'LineWidth',2,'Color',c);
end

%title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.6*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,700])
exportgraphics(gcf,"Fe3+.png",'Resolution',800)