# Dual optimization problem of the (SVM) classifier.
minimize fobj_svm_dual: 1/2 * (sum {i in 1..m, j in 1..m} lambda[i] * y_train[i] * lambda[j] * y_train[j] * sum {k in 1..n} A_train[i,k] * A_train[j,k]) - (sum {i in 1..m} lambda[i]); 

subject to dual_first_constraint: 
	sum{i in 1..m} (lambda[i]*y_train[i]) = 0;
