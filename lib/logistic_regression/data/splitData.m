%% 将数据分成trainning、cross validation、test三个部分

load('data.mat');

disp(size(X));
disp(size(y));


m = size(X, 1);

train_up = m / 100 * 60;
cv_up = m / 100 * 80;
test_up = m;

disp(train_up);
disp(cv_up);
disp(test_up);

x_train = X(1:train_up, :);
y_train = y(1:train_up, :);

x_cv = X(train_up+1:cv_up, :);
y_cv = y(train_up+1:cv_up, :);

x_test = X(cv_up+1:test_up, :);
y_test = y(cv_up+1:test_up, :);

disp(size(x_train));
disp(size(y_train));

disp(size(x_cv));
disp(size(y_cv));

disp(size(x_test));
disp(size(y_test));

save('x_train.mat', 'x_train');
save('y_train.mat', 'y_train');

save('x_cv.mat', 'x_cv');
save('y_cv.mat', 'y_cv');

save('x_test.mat', 'x_test');
save('y_test.mat', 'y_test');
