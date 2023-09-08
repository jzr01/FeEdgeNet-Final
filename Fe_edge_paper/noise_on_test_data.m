noise_list = [5 10 20 30];
for j = 1:4
    for i = 1:length(test_data)
        %add noise 
        y = test_data(i).data;
        y = y + 1;
       
        snr = noise_list(j);
    
        sd =  mean(y)/snr;
    
        %white noise
        whitenoise=  random('normal',0,sd,1,length(y)); 
        a = y + whitenoise;
        a = interp1(695:0.02:735, a,698:0.1:735,'linear');
        a = a -mean(a);
        a = a/std(a);
        eval("test_data(i).snr"+string(noise_list(j))+" = a");
        
    end
end

name = fieldnames(test_data);
MSE_loss = [];
accuarcy_list = [];
for j = 7:10
    num = 0; 
    for i = 1:length(test_data)
        test_data(i).accuarcy_snr5 = predict(cnn1,test_data(i).snr5);
        if abs(test_data(i).accuarcy_snr5 - test_data(i).truth) <=0.1
            num = num + 1;
        end
    end
accuarcy_list(1) = num/length(test_data)


MSE_loss = [];
sum = 0;
for i = 1:length(test_data)
    sum = sum + (test_data(i).accuarcy_snr30 - test_data(i).truth)^2;
end
MSE_loss(4) = mean(sum)
