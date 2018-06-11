function [U,V,k,delta,x1,x2] = parameters()

load('filmtrust/X.mat');
load('filmtrust/Y.mat');

k=10;            %no of latent factors
U=X;             %user latent factor matrix
V=Y;             %item latent factor matrix
delta=0.01;      %learning rate
x1=0.001;        %regularization parameter (lambda U & lambda V)
x2=0.001;        %regularization parameter for similarity (lambda T)

end