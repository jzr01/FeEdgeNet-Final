Y_predict = predict(cnn1,X_test_noise);
Y_test_noise = reshape(Y_test_noise,1000,1);
figure;
hold on;
box on;
scatter(Y_predict,Y_test_noise,5,'filled');
