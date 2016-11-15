%% Kaggle | Digit Recognizer

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 784;  % 28 * 28 Input Images of Digits
hidden_layer_size = 784;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

%% =============== Part 1: Loading Data ================

fprintf('Loading and Visualizing Data ...\n')

X = load('../data/x.mat');
X = double(X.data);

y = load('../data/y.mat');
y = double(y.data);

m = size(X, 1);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Initializing Pameters ================
% 初始化Theta

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% disp(size(initial_Theta1));    % 784 * 785
% disp(size(initial_Theta2));    % 10 * 785

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% disp(size(initial_nn_params));    % 623290 * 1

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =============== Part 3: Gradient Checking ===============
%
fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =================== Part 4: Training NN ===================
fprintf('\nTraining Neural Network... \n');

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 20);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
% 反向传播是求Grad的算法, 求出J和Grad后利用梯度下降法求解使J最小的theta的值
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Save training parameter
save('../data/theta1.mat', 'Theta1');
save('../data/theta2.mat', 'Theta2');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Part 9: Visualize Weights =================
fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
