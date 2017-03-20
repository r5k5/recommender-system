function [mae,rmse] = main()

[A,R_bar,I,T,n,m] = initialize();
[sim] = similarity(A,R_bar,T,n,m);
[U,V] = algorithm(I,A,T,sim,n,m);
mae=MAE(U,V,A,n,m);
rmse=RMSE(U,V,A,n,m);

end