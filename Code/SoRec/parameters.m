function [U,V,Z,k,delta,x1,x2] = parameters()

load('X.mat');
load('Y.mat');
load('G.mat');

k=10;            %no of latent factors
U=X;             %user latent feature matrix
V=Y;             %item latent feature matrix
Z=G;             %factor latent feature matrix
delta=0.01;      %learning rate
x1=0.001;        %regularization parameter
x2=0.001;        %regularization parameter for similarity

end