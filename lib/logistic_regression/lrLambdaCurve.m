function lrLambdaCurve(x_train, y_train, x_cv, y_cv, num_labels, iter_num, lambda_vec)
%% LRLAMBDACURVE 绘制Lambda变换的曲线

count = length(lambda_vec);
error_train = zeros(count, 1);
error_cv   = zeros(count, 1);

for i = 1:count
	lambda = lambda_vec(i);

	% 训练
	theta = logisticRegression(x_train, y_train, num_labels, lambda, iter_num);

	% 计算预测准确率
	train_pred = predictBylr(theta, x_train);
	train_accuracy = mean(double(train_pred == y_train)) * 100;
    fprintf('Training Set Accuracy: %f\n', train_accuracy);

	cv_pred = predictBylr(theta, x_cv);
	cv_accuracy = mean(double(cv_pred == y_cv)) * 100;
    fprintf('CV Set Accuracy: %f\n\n', cv_accuracy);

    error_train(i) = 100 - train_accuracy;
    error_cv(i) = 100 - cv_accuracy;
end	

% %% ============ Draw Curve ============

plot(1:count, error_train, 1:count, error_cv);

title(sprintf('Logistic Regression Lambda Learning Curve'))

xlabel('Lambda Value')
ylabel('Error Percent')

legend('Train', 'Cross Validation')

fprintf('Program paused. Press enter to continue.\n');
pause;

end	