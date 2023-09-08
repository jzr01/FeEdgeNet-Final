figure;
box on;
plot(en_bs,sig_bs,'k','LineWidth',2);
hold on;
plot(en_bs,errfunc,'r-');
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[700 735],'ylim',[0 max(sig_bs)*1.05],'FontSize',20)
x = en_bs(en_bs <= en2);
x_fill = [x, fliplr(x)];
y = sig_bs(en_bs <= en2);
y_fill = [y, zeros(size(y))];
fill(x_fill,y_fill,[0.9290 0.6940 0.1250], 'FaceAlpha',1)

x = en_bs(en_bs > en2);
x_fill = [x, fliplr(x)];
y = sig_bs(en_bs > en2);
y_fill = [y, zeros(size(y))];
fill(x_fill,y_fill,[0.3010 0.7450 0.9330], 'FaceAlpha', 1)

x = en_bs;
x_fill = [x, fliplr(x)];
y = errfunc;
y_fill = [y, zeros(size(y))];
fill(x_fill,y_fill,[0.4660 0.6740 0.1880], 'FaceAlpha', 1)
exportgraphics(gcf,"figure3.png",'Resolution',2400)
