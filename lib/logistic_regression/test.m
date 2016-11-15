%% 测试流程, 用于测试逻辑回归

%% Initialization
clear ; close all; clc

%% =========== 加载数据 =============

fprintf('Loading Data\n')

load('data/data.mat');

m = size(X, 1);
num_labels = 10;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ 逻辑回归 ============

fprintf('Test Logistic Regression\n')

lambda = 0.1;
all_theta = logisticRegression(X, y, num_labels, lambda, 100);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ 验证 ============

fprintf('Test Logistic Regression\n')

pred = predictBylr(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;
