close all
figure
box on;
hold on;
data = test_data;
num = 0;
color1 = {"#0072BD","#D95319",	"#EDB120",	"#7E2F8E","#77AC30","#4DBEEE",	"#A2142F","#000000"};
for i=[5 17 18 22:26]
    num = num + 1;
    x = 695:0.02:735;
    y = data(i).data;
    y = normalize(y,"range");
    plot(x,y+0.5*(num-1),'LineWidth',2,'Color',color1{num});

end

%title(data(j).group+"(ref^{8})",'FontSize',20)
legend({"Fe2O3",'amphibole LC3','Fe3O4','amphibole SC1','augite CVF1','spinel KR35','glass7','FeCO3'},'FontSize',13);
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[705 735],'ylim',[-0.05 0.6*(num+1)],'FontSize',20)
yticks([])
set(gcf,'position',[100,100,400,1000])
exportgraphics(gcf,"Original_test.png",'Resolution',2400)