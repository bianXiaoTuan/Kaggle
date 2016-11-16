#!/bin/env python
#_*_ encoding=utf-8 _*_

import csv
import random
import numpy as np
from scipy import io

def load_data():
    ''' 将训练集转成6份mat文件
    训练集: x.mat y.mat
    交叉验证集: x_cv.mat y_cv.mat
    测试集: x_t.mat y_t.mat

    In Matlab
    x = load('x.mat')
    x = x.data
    '''
    f = open('./data/train.csv', 'rb')
    reader = csv.reader(f)

    # Remove first line
    data = [row for row in reader]
    data = [row for row in data[1:]]

    # Shuffle
    random.shuffle(data)

    total_count = len(data)
    train_up_index = total_count / 100 * 60
    cv_up_index = total_count / 100 * 80
    test_up_index = total_count

    x_train = np.mat([[int(elem) for elem in row[1:]] for row in data[0:train_up_index]])
    y_train = np.mat([int(row[0]) if int(row[0]) != 0 else 10 for row in data[0:train_up_index]])
    y_train = y_train.conj().transpose()

    x_cv = np.mat([[int(elem) for elem in row[1:]] for row in data[train_up_index:cv_up_index]])
    y_cv = np.mat([int(row[0]) if int(row[0]) != 0 else 10 for row in data[train_up_index:cv_up_index]])
    y_cv = y_cv.conj().transpose()

    x_test = np.mat([[int(elem) for elem in row[1:]] for row in data[cv_up_index:test_up_index]])
    y_test = np.mat([int(row[0]) if int(row[0]) != 0 else 10 for row in data[cv_up_index:test_up_index]])
    y_test = y_test.conj().transpose()

    print np.shape(x_train)
    print np.shape(y_train)
    io.savemat('./data/x.mat', {'data': x_train})
    io.savemat('./data/y.mat', {'data': y_train})

    print np.shape(x_cv)
    print np.shape(y_cv)
    io.savemat('./data/x_cv.mat', {'data': x_cv})
    io.savemat('./data/y_cv.mat', {'data': y_cv})

    print np.shape(x_test)
    print np.shape(y_test)
    io.savemat('./data/x_t.mat', {'data': x_test})
    io.savemat('./data/y_t.mat', {'data': y_test})

def load_training_data():
    ''' 将训练集转成mat文件

    In Matlab
    x = load('x.mat')
    x = x.data
    '''
    f = open('./data/train.csv', 'rb')
    reader = csv.reader(f)

    data = [row for row in reader]

    # 训练集数量
    NUM = 10000001
    x = np.mat([[int(elem) for elem in row[1:]] for row in data[1:NUM]])

    # 将 0 转成 10
    y = np.mat([int(row[0]) if int(row[0]) != 0 else 10 for row in data[1:NUM]])
    y = y.conj().transpose()

    io.savemat('./data/x.mat', {'data': x})
    io.savemat('./data/y.mat', {'data': y})

    return y

def load_test_data():
    ''' 将测试集转成*.mat文件
    '''
    f = open('./data/test.csv', 'rb')
    reader = csv.reader(f)

    data = [row for row in reader]

    # NUM = 1000
    NUM = 10000000
    test = np.mat([[int(elem) for elem in row] for row in data[1:NUM]])

    io.savemat('./data/test.mat', {'data': test})

def generate_result():
    ''' 生产符合要求结果文件
    '''
    # 预测值
    f = open('./data/predict.mat', 'r')
    # 科学计数法转int: 1.00000000e+01 -> 10
    predict_nums = [int(float(line)) for line in f.readlines()]
    f.close()

    # 提交结果
    f = open('./data/result.csv', 'w')
    f.write('ImageId,Label\n')

    id = 1
    for num in predict_nums:
        # 将预测为10的转化成0
        num = num if num != 10 else 0
        f.write("%d,%d\n" % (id, int(num)))
        id = id + 1

    f.close()

def verify():
    ''' 将训练结果作用于测试集, 验证测试效果
    '''
    # 读取测试集训练数据
    f = open('./data/predict.mat', 'r')
    predict_nums = [line.split('.')[0].strip() for line in f.readlines()]
    f.close()

    length = len(predict_nums)

    # 读取训练集结果数据
    f = open('./data/train.csv', 'rb')
    reader = csv.reader(f)
    data = [row for row in reader]
    trains_nums = [int(row[0]) for row in data[1 : length + 1]]
    f.close()

    # 计算准确率
    right_count = 0
    for i in range(length):
        if int(predict_nums[i]) == int(trains_nums[i]):
            right_count = right_count + 1 

    print right_count
    print '预测准确率: %f' % (float(right_count) / float(length))

if __name__ == '__main__':
    load_data()
    #load_training_data()
    #load_test_data()
    # generate_result()
    # verify()
