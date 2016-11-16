%% Verify the data for training
x = load('./data/x.mat');
x = double(x.data);
disp(size(x));

y = load('./data/y.mat');
y = double(y.data);
disp(size(y));

x_cv = load('./data/x_cv.mat');
x_cv = double(x_cv.data);
disp(size(x_cv));

y_cv = load('./data/y_cv.mat');
y_cv = double(y_cv.data);
disp(size(y_cv));

x_test = load('./data/x_t.mat');
x_test = double(x_test.data);
disp(size(x_test));

y_test = load('./data/y_t.mat');
y_test = double(y_test.data);
disp(size(y_test));
