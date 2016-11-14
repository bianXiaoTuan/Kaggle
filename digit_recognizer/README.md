{toc}

# Data

## train.csv

* Each image is 28 * 28, for a total of 784 pixels in total
* Each pixel has a signle pixel-value associated with it
* Pixel-value is an integer between 0 and 255
* Total data size = 42001 * 785

Example:
{code}
label,pixel0,pixel1,...,pixel42000
1,0,0,...,1src
2,0,0,...,3
3,0,0,...,4
5,0,0,...,3
{code}

图片像素:
{code}
000 001 002 003 ... 026 027
028 029 030 031 ... 054 055
056 057 058 059 ... 082 083
 |   |   |   |  ...  |   |
728 729 730 731 ... 754 755
756 757 758 759 ... 782 783 
{code}

## result.csv

Example
{code}
ImageId,Label
1,3
2,7
3,8 
(27997 more lines)
{code}

# Logistic Regression

* 执行tools.py中load_train_data()
* 执行train
* 执行tools.py中load_test_data()
* 执行predict 
* 执行tools.py中generate_result()
* 结果为result.csv

## 提交记录

使用48000个训练集, lambda = 0.1, 迭代次数 = 100
使用训练集作为测试集，准确率: 92.614
使用测试集，准确率: 91.357

{code}
Training One-vs-All Logistic Regression...
Iteration   100 | Cost: 1.892930e-02
Iteration   100 | Cost: 6.670110e-02
Iteration   100 | Cost: 8.513016e-02
Iteration   100 | Cost: 4.373132e-02
Iteration   100 | Cost: 8.311120e-02
Iteration   100 | Cost: 3.740943e-02
Iteration   100 | Cost: 4.392053e-02
Iteration   100 | Cost: 1.480923e-01
Iteration   100 | Cost: 1.066616e-01
Iteration   100 | Cost: 1.908072e-02
{code}

使用48000个训练集, lambda = 0.1, 迭代次数 = 400
使用训练集作为测试集，准确率: 93.202381
使用测试集，准确率: 0.91357
证明提高迭代次数效果不明显

{code}
Training One-vs-All Logistic Regression...
Iteration   400 | Cost: 1.493759e-02
Iteration   400 | Cost: 6.337745e-0222
Iteration   400 | Cost: 8.274349e-02
Iteration   400 | Cost: 4.058277e-02
Iteration   400 | Cost: 7.748457e-02
Iteration   400 | Cost: 3.434329e-02
Iteration   400 | Cost: 4.010869e-02
Iteration   400 | Cost: 1.438395e-01
Iteration   400 | Cost: 1.019488e-01
Iteration   400 | Cost: 1.818088e-02
Program paused. Press enter to continue.
{code}

只使用1000个训练集

# Neural Network

## Neural Network Topology

(784 + 1) * (784 + 1) * 10





