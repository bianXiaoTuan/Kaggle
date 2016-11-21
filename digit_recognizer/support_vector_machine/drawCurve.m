%% Draw Learning Curve of Logistic Regression

%% ============ Load Data ============
clear ; close all; clc
addpath(genpath('../../lib'));

x_train = load('../data/x_train.mat');
x_train = double(x_train.data);

y_train = load('../data/y_train.mat');
y_train = double(y_train.data);

x_cv = load('../data/x_cv.mat');
x_cv = double(x_cv.data);

y_cv = load('../data/y_cv.mat');
y_cv = double(y_cv.data);

x_train = x_train(1:101, :);
y_train = y_train(1:101);

x_cv = x_cv(102, :);
y_cv = y_cv(102);

% x_cv = x_train;
% y_cv = y_train;

% C_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
% sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';

% % Try different SVM Parameters here
% [C, sigma] = dataset3Params(x_train, y_train, x_cv, y_cv, C_vec, sigma_vec);

% % Train the SVM
% model= svmTrain(x_train, y_train, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
% pred = svmPredict(model, x_cv);
% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y_cv)) * 100);

%% ============ Training y == 1 ============

% displayData(x_cv);

k = 1; C = 1; sigma = 0.1;

y_train = double(y_train == k);    % 防止y_train变为一个bool matrix
y_cv = double(y_cv == k);

disp(y_cv);

model= svmTrain(x_train, y_train, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
pred = svmPredict(model, x_cv);

disp(pred);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y_cv)) * 100);

%% ============ Computer Error ============

% fprintf('SVM training ....')

% % SVM Parameters
% for k = 1:10
% 	C = 1; sigma = 0.1;

% 	model= svmTrain(x_train, int32(y_train==k), C, @(x1, x2) gaussianKernel(x1, x2, sigma));
% 	p = svmPredict(model, x_cv);
% 	fprintf('K = %d', k);
% 	fprintf('\nTraining Set Accuracy: %f\n', mean(double(p == (y_cv == k))) * 100);
% end

