close all
figure
box on;
hold on;
data = test_data;
num = 0;
color1 = {"#0072BD","#D95319",	"#EDB120",	"#7E2F8E","#77AC30","#4DBEEE",	"#A2142F","#000000"};
for i=[5 17 18 22:26]
    num = num + 1;
    x = 698:0.1:735;
    y = data(i).snr30;
    y = normalize(y,"range");
    plot(x,y+0.5*(num-1),'LineWidth',2,'Color',color1{num});

end

%title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.52*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,1000])
exportgraphics(gcf,"SNR30_test.png",'Resolution',2400)

close all
figure
box on;
hold on;
data = test_data;
num = 0;
color1 = {"#0072BD","#D95319",	"#EDB120",	"#7E2F8E","#77AC30","#4DBEEE",	"#A2142F","#000000"};
for i=[5 17 18 22:26]
    num = num + 1;
    x = 698:0.1:735;
    y = data(i).snr20;
    y = normalize(y,"range");
    plot(x,y+0.5*(num-1),'LineWidth',2,'Color',color1{num});

end

%title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.52*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,1000])
exportgraphics(gcf,"SNR20_test.png",'Resolution',2400)

close all
figure
box on;
hold on;
data = test_data;
num = 0;
color1 = {"#0072BD","#D95319",	"#EDB120",	"#7E2F8E","#77AC30","#4DBEEE",	"#A2142F","#000000"};
for i=[5 17 18 22:26]
    num = num + 1;
    x = 698:0.1:735;
    y = data(i).snr10;
    y = normalize(y,"range");
    plot(x,y+0.5*(num-1),'LineWidth',2,'Color',color1{num});

end

%title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.52*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,1000])
exportgraphics(gcf,"SNR10_test.png",'Resolution',2400)

close all
figure
box on;
hold on;
data = test_data;
num = 0;
color1 = {"#0072BD","#D95319",	"#EDB120",	"#7E2F8E","#77AC30","#4DBEEE",	"#A2142F","#000000"};
for i=[5 17 18 22:26]
    num = num + 1;
    x = 698:0.1:735;
    y = data(i).snr5;
    y = normalize(y,"range");
    plot(x,y+0.5*(num-1),'LineWidth',2,'Color',color1{num});

end

%title(data(j).group+"(ref^{8})",'FontSize',20)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.52*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,1000])
exportgraphics(gcf,"SNR5_test.png",'Resolution',2400)