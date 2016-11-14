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

# 提交记录

## Logistic Regression

使用1000个训练集, lambda = 0.1, 迭代次数 = 100
使用训练集作为测试集，准确率: 0.893000

使用48000个训练集, lambda = 0.1, 迭代次数 = 100
使用训练集作为测试集，准确率: 0.831500
使用测试集，准确率: 0.81786

## Logistic Regression with Regularization
只使用1000个训练集

## Neural Network

## Neural Network with Regularization

