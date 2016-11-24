#!/bin/env python
#_*_ encoding=utf-8 _*_

import csv
import random
import numpy as np
from scipy import io

def quantize(data):
    ''' 将字符串的Features转化成数值
    '''
    feature_num = len(data[0])
    feature_num_maps = [] 

    # Need to return 
    numberic_data = []

    # Buld feature_num_map
    for i in range(feature_num):
        if data[0][i].isdigit():
            feature_num_maps[i] = 'Numberic'
            
def load_data():
    ''' 加载数据
    '''
    # Load data
    f = open('./data/train.csv', 'rb')
    reader = csv.reader(f)
    data = [row for row in reader]

    # Remove first line
    data = [row for row in data[1:]]

    # Data and target
    data = [row[1:-1] for row in data]    # remove ID
    target = [row[-1] for row in data]

    # Normalize data
    numberic_data = quantize(data)

if __name__ == '__main__':
    load_data()
