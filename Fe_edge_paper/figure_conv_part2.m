figure;
box on;
hold on;

x = 695:0.02:735;
y = test_data(30).data;

plot(x,normalize(y,'range'),'LineWidth',2);

indzero = find(f0==max(f0));
yconv = conv(y,f0);
N = length(y);

yconv = circshift(yconv,-indzero);

y = yconv(1:N);
plot(x,normalize(y,'range'),'LineWidth',2);

set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 730],'ylim',[-0.05 1.05],'FontSize',20)
legend('Orginal spectrum','Instrument Broadening','FontSize',12)
yticks([0:0.5:1]);
exportgraphics(gcf,"conv_compare.png",'Resolution',2400)
