%% 将Data数据分成按照60%、20%、20%的比例
%% 分成trainning、cross validation、test三部分
%% 存入splitData.mat中

clear ; close all; clc
addpath(genpath('../../../lib'));

load('data.mat');
m = size(X, 1);

%% Shuffle
rand_indexes = randperm(m);
X = X(rand_indexes, :);
y = y(rand_indexes, :);

%% 计算每部分数据up_index
train_up = m / 100 * 60;
cv_up = m / 100 * 80;
test_up = m;

%% 拆分数据
x_train = X(1:train_up, :);
y_train = y(1:train_up, :);

x_cv = X(train_up+1:cv_up, :);
y_cv = y(train_up+1:cv_up, :);

x_test = X(cv_up+1:test_up, :);
y_test = y(cv_up+1:test_up, :);

%% 存储数据
save('splitData.mat');

%% 检查shuffle后图片和数据是否对应
x = x_cv(1:16, :);
y = y_cv(1:16);

displayData(x);
disp(y);
