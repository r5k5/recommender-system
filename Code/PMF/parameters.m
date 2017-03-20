function [U,V,delta,x1] = parameters()

load('X.mat');
load('Y.mat');

k=10;            %no of latent factors
U=X;             %user latent factor matrix
V=Y;             %item latent factor matrix
delta=0.01;      %learning rate
x1=0.001;        %regularization parameter

end