#!/bin/env python
#_*_ encoding=utf-8 _*_

import csv
import numpy as np
from scipy import io

def load_training_data():
    ''' 将训练集转成*.mat文件
    In Matlab
    x = load('x.mat')
    x = x.matrix
    '''
    f = open('data/train.csv', 'rb')
    reader = csv.reader(f)

    data = [row for row in reader]

    # NUM = 1001
    NUM = 100100
    x = np.mat([[int(elem) for elem in row[1:]] for row in data[1:NUM]])

    y = np.mat([int(row[0]) for row in data[1:NUM]])
    y = y.conj().transpose()

    io.savemat('data/x.mat', {'matrix': x})
    io.savemat('data/y.mat', {'matrix': y})

    return y

def load_test_data():
    ''' 将测试集转成*.mat文件
    '''
    f = open('data/test.csv', 'rb')
    reader = csv.reader(f)

    data = [row for row in reader]

    # NUM = 1000
    NUM = 1000000
    test = np.mat([[int(elem) for elem in row] for row in data[1:NUM]])

    io.savemat('data/test.mat', {'matrix': test})

def generate_result():
    ''' 生产符合要求结果文件
    '''
    f = open('data/predict.mat', 'r')
    nums = [line.split('.')[0].strip() for line in f.readlines()]
    f.close()

    f = open('data/result.csv', 'w')
    f.write('ImageId,Label\n')

    id = 1
    for num in nums:
        num = num if num != 10 else 0
        f.write("%d,%d\n" % (id, int(num)))
        id = id + 1

    f.close()

def verify():
    ''' 将训练结果作用于测试集, 验证测试效果
    '''
    # 读取训练集结果数据
    f = open('data/train.csv', 'rb')
    reader = csv.reader(f)
    data = [row for row in reader]
    trains_nums = [int(row[0]) for row in data[1:]]
    f.close()

    # 读取测试集训练数据
    f = open('data/predict.mat', 'r')
    predict_nums = [line.split('.')[0].strip() for line in f.readlines()]
    f.close()

    # 计算准确率
    right_count = 0
    length = len(predict_nums)
    for i in range(length):
        if predict_nums[i] == trains_nums[i]:
            right_count = right_count + 1 

    print right_count
    print '预测准确率: %f' % (right_count/length)

if __name__ == '__main__':
    # load_training_data()
    # load_test_data()
    # generate_result()
    # verify()
