close all;
clear all;
clc;

%set covariance matrix
K = [2 -1 1; -1 2 0; 1 0 2];

%get svd of K:
%  columns of U are eigenvectors of K
%  diagonal elements of V are eigenvalues of K
[U,V] = svd(K);

%we can diagonalize K with
diagMatrix = U.'*K*U;

%can check that eigenvalues of K are the entries of diagonal matrix
eig(K)