close all
en = 695:0.1:740;
en1 = 698:0.1:735;
figure;
box on;
t_list = [1:1:4];
for i = 1:4
hold on;

%select a random combination
index = 2;

%get the 2+ and 3+ data
x2 = Fe_combine_data(index).x2;
x3 = Fe_combine_data(index).x3;
y2 = Fe_combine_data(index).y2;
y3 = Fe_combine_data(index).y3;
    
w = 0;


%add 2+ and 3+ up
x = intersect(x2,x3);
c2 = ismember(x2,x);
c3 = ismember(x3,x);
y = w * y2(c2) + (1-w)* y3(c3);


%extend the spectrum to 695 to 740ev
y = interp1(x,y,en,'linear','extrap');
y(en <= x(1)) = y(1);
y(en >= x(end)) = y(end);



thickness = t_list(i);
fwhm_zlp = 0.3;
fwhm_loren = 0.3;
[~, f] = pluralKernel_Gaussian(thickness,fwhm_zlp,fwhm_loren);




indzero = find(f==max(f));
yconv = conv(y,f);
N = length(y);

yconv = circshift(yconv,-indzero);

y = yconv(1:N);



y = y(en<=735 & en >= 698);


plot(en1,normalize(y,'range'),'LineWidth',2)
end

set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[728 735],'ylim',[0.28 0.35],'FontSize',20)
xticks([])
yticks([])
exportgraphics(gcf,"thickness spectra zoom in.png",'Resolution',2400)