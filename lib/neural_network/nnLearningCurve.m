function nnLearningCurve(x_train, y_train, x_cv, y_cv, num_labels, num, lambda, iter_num, hidden_layer_size)
%NNLEARNINGCURVE 绘制Neural Network Learning Curve 

m = size(x_train, 1);
step = m / num;

error_train = zeros(num, 1);
error_cv   = zeros(num, 1);

%% 训练并计算Error
for n = 1:num
	% 训练
	count = n * step;
    fprintf('Training Set Size: %d\n', count);

    [theta1 theta2] = neuralNetwork(x_train(1:count, :), y_train(1:count), lambda, iter_num, hidden_layer_size, num_labels);

	% 计算预测准确率
	train_pred = predictBynn(theta1, theta2, x_train(1:count, :));
	train_accuracy = mean(double(train_pred == y_train(1:count))) * 100;
    fprintf('Training Set Accuracy: %f\n', train_accuracy);

	cv_pred = predictBynn(theta1, theta2, x_cv);
	cv_accuracy = mean(double(cv_pred == y_cv)) * 100;
    fprintf('Training Set Accuracy: %f\n\n', cv_accuracy);

    error_train(n) = 100 - train_accuracy;
    error_cv(n) = 100 - cv_accuracy;
end	

% %% ============ Draw Curve ============

plot(1:num, error_train, 1:num, error_cv);
title(sprintf('Neural Network Learning Curve'))

xlabel('Number of training examples')
ylabel('Error')

legend('Train', 'Cross Validation')

set(gca,'xtick',[])

fprintf('Program paused. Press enter to continue.\n');
pause;
