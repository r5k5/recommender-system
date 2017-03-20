function [mae,rmse,time] = main()

tic

[A,I,T,d_in,d_out,n,m] = initialize();
[U,V] = algorithm(I,A,T,d_in,d_out,n,m);
mae=MAE(U,V,A,n,m);
rmse=RMSE(U,V,A,n,m);

time=toc;

end