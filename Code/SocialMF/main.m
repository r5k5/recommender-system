function [mae,rmse,time] = main()

tic

[A,I,T,n,m] = initialize();
[U,V] = algorithm(I,A,T,n,m);
mae=MAE(U,V,A,n,m);
rmse=RMSE(U,V,A,n,m);

time=toc;

end