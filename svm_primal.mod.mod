# Parameters.
param n >= 1, integer;
param m >= 1, integer;
param y {i in 1..m};
param A {1..m,1..n};
param Y {1..m, 1..m};

###
# Acabar (genera matriu Y a partir de y, més simple).
param n;  # Size of the vector
param y{1..n};  # Vector elements

param Y{i in 1..n, j in 1..n} default 0;
# Assign diagonal elements
param Y_diag{i in 1..n} := y[i];
###

# Variables and variable limits.
var nu;
var w {i in 1..n};
var gamma;
var s {1..m} >= 0;
var lambda {1..m} >= 0;
var e{1..m} = 1;

# Primal optimization problem of the (SVM) classifier.
minimize fobj_svm_primal: 1/2*sum{i in 1..n} (w[i]^2) + nu*sum{j in 1..m} (s[j]);

subject to primal_constraint {i in 1..m}: 
	y[i]*(sum{j in 1..n} (A[i,j]*w[j]) + gamma) + s[i] >= 1;

# Dual optimization problem of the (SVM) classifier.
minimize fobj_svm_dual: 1/2*sum{t in 1..m}(sum{l in 1..m} (sum{k in 1..n} (sum{j in 1..m} (sum{i in 1..m} (lambda[i]*Y[i,j])*A[j,k])*A[l,k])*Y[l,t])*lambda[t]) + sum{i in 1..m} (lambda[i])

subject to dual_first_constraint: 
	sum{i in 1..m} (lambda[i]*y[i]) = 0;

subject to dual_second_constraint:
	nu*sum{j in 1..m} (e[j]) >= sum{k in 1..m} (lambda[k]);
