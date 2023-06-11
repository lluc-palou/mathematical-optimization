minimize fobj_gaussian_kernel:
	(1/2) * (sum {i in 1..m, j in 1..m} lambda[i] * y_train[i] * lambda[j] * y_train[j] * exp(-(1/n * (sum{k in 1..n} (A_train[i,k] - A_train[j,k])^2)))) - (sum {i in 1..m} lambda[i]); 

subject to c1:
	sum {i in 1..m} lambda[i] * y_train[i] = 0;