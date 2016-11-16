%% Draw Lambda Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc

load('./data/splitData.mat');

%% ============ Computer Error ============

m = size(x_train, 1);

iter_num = 5;
num_labels = 10;

% lambda_vec = [0 0.01 0.02 0.04 0.1 0.3 0.5 0.7 1 3 4 5 8]';
lambda_vec = [0 0.01 0.02 0.1 0.2 1 2 3 4 5 6 7]';
count = length(lambda_vec);

error_train = zeros(count, 1);
error_cv   = zeros(count, 1);
error_test   = zeros(count, 1);

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
    fprintf('CV Set Accuracy: %f\n', cv_accuracy);

	test_pred = predictBylr(theta, x_test);
	test_accuracy = mean(double(test_pred == y_test)) * 100;
    fprintf('Test Set Accuracy: %f\n\n', test_accuracy);

    error_train(i) = 100 - train_accuracy;
    error_cv(i) = 100 - cv_accuracy;
    error_test(i) = 100 - test_accuracy;
end	

% %% ============ Draw Curve ============

plot(1:count, error_train, 1:count, error_cv, 1:count, error_test);

title(sprintf('Logistic Regression Lambda Learning Curve'))

xlabel('Lambda Value')
ylabel('Error Percent')

legend('Train', 'Cross Validation', 'Test')

fprintf('Program paused. Press enter to continue.\n');
pause;
