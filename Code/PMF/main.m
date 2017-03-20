function [mae,rmse] = main()

[A,I,n,m] = initialize();
[U,V] = algorithm(I,A,n,m);
mae=MAE(U,V,A,n,m);
rmse=RMSE(U,V,A,n,m);

end