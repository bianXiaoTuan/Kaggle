%% Kaggle | Learning Curve

%% Initialization
clear ; close all; clc
addpath(genpath('../../lib'));

%% =========== Part 1: Loading =============

fprintf('Loading Data\n')

% Training data
X = load('../data/x.mat');
X = double(X.data);

y = load('../data/y.mat');
y = double(y.data);

% Cross Validation data
X_cv = load('../data/x_cv.mat');
X_cv = double(X_cv.data);

y_cv = load('../data/y_cv.mat');
y_cv = double(y_cv.data);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2: Learning Curve ============

fprintf('\nLearning Curve...\n')

[m n] = size(X);
[m_cv n_cv] = size(X_cv);

lambda = 0.1;
iter_num = 20;
num_labels = 10;

[error_train, error_cv] = lrLearningCurve([ones(m, 1) X], y, [ones(m_cv, 1) X_cv], y_cv, lambda, iter_num, num_labels);

plot(1:m, error_train, 1:m, error_val);
title('Learning curve for logistic regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])

fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
pause;
