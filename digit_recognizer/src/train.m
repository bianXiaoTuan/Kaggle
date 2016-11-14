%% Kaggle | Digit Recognizer

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use
num_labels = 10;          % 10 labels, from 0 to 9

%% =========== Part 1: Loading =============

fprintf('Loading Data\n')

X = load('../data/x.mat');
X = double(X.data);

y = load('../data/y.mat');
y = double(y.data);

m = size(X, 1);

% disp(size(X));    % 1000 * 784
% disp(size(y));    % 1000 * 1

% Randomly select 100 data points to display
% rand_indices = randperm(m);
% sel = X(rand_indices(1:100), :);
% displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2: Vectorize Logistic Regression ============

fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.1;
[all_theta] = multiLogisticRegression(X, y, num_labels, lambda);

save('../data/all_theta.mat', 'all_theta');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Predict for One-Vs-All ================

% pred = predictOneVsAll(all_theta, X);

% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);