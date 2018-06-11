function [mae,rmse,time] = main()

tic

[A,I,T,n,m] = initialize();
[C,R_bar] = reputation(A,I,n,m);
[sim] = similarity(A,R_bar,T,n,m);
[U,V] = algorithm(I,C,A,T,sim,n,m);
mae=MAE(U,V,A,n,m);
rmse=RMSE(U,V,A,n,m);

time=toc;

end