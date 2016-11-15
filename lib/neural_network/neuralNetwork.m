function [theta1 theta2] = neuralNetwork(X, y, lambda, iter_num, input_layer_size, hidden_layer_size, num_labels)
%NEURALNETWORK 对训练集数据进行神经网络训练, 返回all_theta
%
% Param:
% X: 训练集
% y: 训练集对应结果, 映射为[1 2 ... num_labels]
% topology: 神经网络拓扑 e.g. [10 10 2] input_layer=10 hidden_layer=10 output_layer=2
% lambda: 正则因子
% iter_num: 迭代次数
%
% Return:
% all_theta: 逻辑回归all_theta

addpath(genpath('../../lib'));

theta1 = zeros(hidden_layer_size, input_layer_size + 1);
theta2 = zeros(num_labels, hidden_layer_size + 1);

%% ============ 参数检查 ============
[m n] = size(X);

if m ~= size(y, 1)
	fprintf('size(X, 1) must equal to size(y, 1).\n');
	exit;
end	

%% ============ 初始化Theta ============
initial_theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_theta1(:) ; initial_theta2(:)];

disp(size(initial_theta1));
disp(size(initial_theta2));

%% ============ CostFunction ============
costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

%% ============ 神经网络训练 ============
options = optimset('MaxIter', iter_num);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

%% ============ 还原theta1 theta2 ============
theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

