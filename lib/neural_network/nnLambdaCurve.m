function nnLambdaCurve(x_train, y_train, x_cv, y_cv, num_labels, lambda_vec, iter_num, hidden_layer_size)
%NNLEARNINGCURVE 绘制Neural Network Learning Curve 

count = length(lambda_vec);
error_train = zeros(count, 1);
error_cv   = zeros(count, 1);

for i = 1:count
	lambda = lambda_vec(i);
    fprintf('Lambda: %f\n', lambda);

    [theta1 theta2] = neuralNetwork(x_train, y_train, lambda, iter_num, hidden_layer_size, num_labels);

	% 计算预测准确率
	train_pred = predictBynn(theta1, theta2, x_train);
	train_accuracy = mean(double(train_pred == y_train)) * 100;
    fprintf('Training Set Accuracy: %f\n', train_accuracy);

	cv_pred = predictBynn(theta1, theta2, x_cv);
	cv_accuracy = mean(double(cv_pred == y_cv)) * 100;
    fprintf('Training Set Accuracy: %f\n\n', cv_accuracy);

    error_train(i) = 100 - train_accuracy;
    error_cv(i) = 100 - cv_accuracy;
end	

% %% ============ Draw Curve ============

plot(1:count, error_train, 1:count, error_cv);

title(sprintf('Neural Network Lambda Learning Curve'))

xlabel('Lambda Value')
ylabel('Error Percent')

legend('Train', 'Cross Validation')

set(gca,'xtick',[])

fprintf('Program paused. Press enter to continue.\n');
pause;
