%
i = 13;
close all

data = importdata('L23edge_nobackground.txt');

en_bs=Fe3_normalize(i).x;
sig_bs = Fe3_normalize(i).y;

%figure;
plot(en_bs,sig_bs);
title('**Please click 5 times**')
set(gca,'xlim',[min(en_bs),min(en_bs)+120]);
hold off
drawnow;
fprintf('\n**Please click 5 times**\n');
fprintf('l: click on the start of L3\n2: click on peak of L3\n3: click on the valley between L3 and L2\n4: click on the peak of L2\n5: click on where the L2 ends\n');
pos = ginput(5);
%l: click on the start of L3
%2: click on peak of L3
%3: click on the valley between L3 and L2
%4: click on the peak of L2
%5: click on where the L2 ends


enL3start = pos(1,1); %where L3 starts
en1 = pos(2,1); %initial guess for enL3
en2 = pos(3,1); %initial guess for envalley
en3 = pos(4,1); %initial guess for enL2
enL2end = pos(5,1); %where L2 ends
bgsig = pos(5,2); %the L2 ending intensity


ind = en_bs>=en1-2.5 & en_bs<=en1+2.5;
ensel = en_bs(ind);
sigsel = sig_bs(ind);
enL3 = ensel(sigsel==max(sigsel)); %L3 peak

ind = en_bs>=en3-2.5 & en_bs<=en3+2.5;
ensel = en_bs(ind);
sigsel = sig_bs(ind);
enL2 = ensel(sigsel==max(sigsel)); %L2 peak

ind = en_bs>=en2-2.5 & en_bs<=en2+2.5;
ensel = en_bs(ind);
sigsel = sig_bs(ind);
envalley = ensel(sigsel==min(sigsel)); %L2,3 valley

envalley = envalley(1);
enL2 = enL2(1);
enL3 = enL3(1);

stepfunc = zeros(size(sig_bs));
ind3 = en_bs>=enL2;
ind2 = en_bs>=enL3 & en_bs<enL2;
ind1 = en_bs<enL3;
stepfunc(ind3) = bgsig;
stepfunc(ind2) = bgsig*2/3; %the L2,3 step function

errfunc = (erf(en_bs-enL3)+1)/2*bgsig*2/3 + (erf(en_bs-enL2)+1)/2*bgsig*1/3; %the L2,3 error function



