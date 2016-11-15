function [all_theta] = logisticRegression(X, y, num_labels, lambda, iter_num)
%LOGISTICALREGRESSION 对训练集数据进行逻辑回归, 返回all_theta
%
% Param:
% X: 训练集
% y: 训练集对应结果, 映射为[1 2 ... num_labels]
% num_labels: 结果种类数
% lambda: 正则因子
% iter_num: 迭代次数
%
% Return:
% all_theta: 逻辑回归all_theta

%% ============ 参数检查 ============
[m n] = size(X);
all_theta = zeros(num_labels, n + 1);

if m ~= size(y, 1)
	fprintf('size(X, 1) must equal to size(y, 1).\n');
	exit;
end	

%% ============ 逻辑回归 ============

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);
options = optimset('GradObj', 'on', 'MaxIter', iter_num);
for k = 1:num_labels
    [theta] = fmincg(@(t)lrCostFunction(t, X, (y == k), lambda), initial_theta, options);
    all_theta(k, : ) = theta';
end
