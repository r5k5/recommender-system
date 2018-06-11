function [rmse] = RMSE(U,V,A,n,m)

count=0;
rmse=0;

for i=1:n
    for j=1:m
        if A(i,j)>0
            count=count+1;
            rmse=rmse+(U(i,:)*V(j,:)'-A(i,j))^2;
        end
    end
end

rmse=rmse/count;
rmse=sqrt(rmse);

end