function [mae] = MAE(U,V,A,n,m)

count=0;
mae=0;

for i=1:n
    for j=1:m
        if A(i,j)>0
            count=count+1;
            mae=mae+abs(U(i,:)*V(j,:)'-A(i,j));
        end
    end
end

mae=mae/count;

end