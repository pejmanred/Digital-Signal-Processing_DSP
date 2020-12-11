
close all;
clear all;
clc;

%define covariance matrices
%P = [2 1; 1 2];
%Q = [3 -1; -1 3];

P = [3 1; 1 3];
Q = [5 -2; -2 1];

%compute inverse
PInv = inv(P);

%compute eigenvalues and eigenvectors of PInvQ
[V,D]   = eig(PInv*Q);
eValues = diag(D);

%need to solve for constants such that vi^(T)Pvi = 1
%get columns of U
v1Prime = V(:,1);
v2Prime = V(:,2);

%these vprime vectors should satisfy (PInv*Q-evalue)viPrime = 0
check1 = (PInv*Q-eValues(1)*eye(2))*v1Prime;
check2 = (PInv*Q-eValues(2)*eye(2))*v2Prime;

%we compute
t1 = v1Prime.'*P*v1Prime;
t2 = v2Prime.'*P*v2Prime;

%note that t1 = 1 and t2 = 3.  So, we need K1 = 1/t1 and K2 = 1/sqrt(t2);
K1 = 1/sqrt(t1);
K2 = 1/sqrt(t2);
v1 = K1*v1Prime;
v2 = K2*v2Prime;

%we can check, both t1 and t2 equal 1 as they should
t1 = v1.'*P*v1;
t2 = v2.'*P*v2;

%we can now construct the V matrix as
V = [v1 v2];

%let's check that V really diagonalizes both matrices
diagMat1 = V'*P*V;
diagMat2 = V'*Q*V;