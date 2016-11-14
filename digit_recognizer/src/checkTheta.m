%% 检查训练all_theta是否正确

%% Initialization
clear ; close all; clc

%% =========== Part 1: Loading and Visualizing Data =============

fprintf('Loading and Visualizing Data\n')

X = load('../data/x.mat');
X = double(X.data);

all_theta = load('../data/all_theta.mat');
all_theta = double(all_theta.all_theta);

%disp(size(X));    % 1000 * 784
%disp(size(all_theta));    % 100 * 785

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Predict for One-Vs-All ================

m = size(X, 1);
X = [ones(m, 1) X];

h = sigmoid(X * all_theta');

[v, index] = max(h');
index = int32(index');

% Save predict data to predict.mat
save('../data/predict.mat', 'index', '-ascii');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Random Pic to Predict ==================

% Random choice one pic
random_index = int32(rand() * m);
sel = X(random_index, 2:end);

% Display pic
displayData(sel);

% Predict
p = predictOneVsAll(all_theta, sel);
disp(p);

fprintf('Program paused. Press enter to continue.\n');
pause;
