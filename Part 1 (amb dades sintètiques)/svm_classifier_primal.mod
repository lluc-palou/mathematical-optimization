# Primal optimization problem of the (SVM) classifier
minimize fobj_svm_primal: 1/2 * sum{i in 1..n} w[i]^2 + nu * sum{j in 1..m} s[j];

subject to c1 {i in 1..m}: 
	-y_train[i] * (sum{j in 1..n} (A_train[i, j] * w[j]) + gamma) - s[i] + 1 <= 0;

subject to c2 {i in 1..m}:
	-s[i] <= 0;
