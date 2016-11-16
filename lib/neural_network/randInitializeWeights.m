function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS äº§ç????????©é?

espilon_init = 0.12;
W = rand(L_out, L_in + 1) * 2 * espilon_init - espilon_init;
end