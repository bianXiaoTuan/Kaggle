function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS 产生申请网络随机权重数组

espilon_init = 0.12;
W = rand(L_out, L_in + 1) * 2 * espilon_init - espilon_init;
end