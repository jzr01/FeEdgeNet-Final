close all
figure;
hold on;
en = 695:0.1:740;
en1 = 698:0.1:735;
%select a random combination
index = 2;

%get the 2+ and 3+ data
x2 = Fe_combine_data(index).x2;
x3 = Fe_combine_data(index).x3;
y2 = Fe_combine_data(index).y2;
y3 = Fe_combine_data(index).y3;
    

w = 0.9;



%add 2+ and 3+ up
x = intersect(x2,x3);
c2 = ismember(x2,x);
c3 = ismember(x3,x);
y = w * y2(c2) + (1-w)* y3(c3);


%add a random shift
shift = 0;
x = x + shift;

ystart = y(1);
yend = y(end);

%extend the spectrum to 695 to 740ev
y = interp1(x,y,en,'linear','extrap');
y(en <= x(1)) = ystart;
y(en >= x(end)) = yend;



y = y(en<=735 & en >= 698);

plot(en1,y,'LineWidth',2)
    
r = 57;

sd = max(y)/r;

%white noise
whitenoise=  random('normal',0,sd,1,length(y)); 
y = y + whitenoise;

% Define the probability of adding salt and pepper noise and the noise magnitude
p = 0.1;
noise_magnitude = 0.5;

% Add salt and pepper noise to the vector
y_noisy = y;
y_noisy(rand(size(y)) < p/2) = noise_magnitude;
y_noisy(rand(size(y)) < p/2) = -noise_magnitude;

plot(en1,y,'LineWidth',1)
set(gca,'FontSize',13,'Linewidth',1.5,"FontWeight",'bold');
set(gca,'xlim',[695 738],'ylim',[-0.001 0.03],'FontSize',20)
yticks([0:0.01:0.03]);
box on;
legend('No noise','With noise')
exportgraphics(gcf,"figure4.png",'Resolution',2400)