%% 测试流程, 用于测试神经网络

%% Initialization
clear ; close all; clc
addpath(genpath('../../lib'));

%% =========== 加载数据 =============

fprintf('Loading Data\n')

load('data/data.mat');

disp(size(X));    % 5000 * 400
disp(size(y));    % 5000 * 1

%% ============ 绘制图a ============
m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

%% ============ 神经网络训练 ============

fprintf('Test Logistic Regression\n')

lambda = 0.1;
iter_num = 100;
hidden_layer_size = 25;
num_labels = 10;

[theta1 theta2] = neuralNetwork(X, y, lambda, iter_num, hidden_layer_size, num_labels)

disp(size(theta1));    % 25 * 401
disp(size(theta2));    % 10 * 26

%% ============ 验证 ============

pred = predictBynn(theta1, theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;
