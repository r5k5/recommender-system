function [U,V] = algorithm(I,C,A,T,sim,n,m)

[U,V,k,delta,x1,x2]=parameters();

steps=1;
temp=zeros(n,k);

for i=1:n
    for j=1:n
        if T(i,j)==1
            temp(i,:)=temp(i,:)+sim(i,j)*(U(i,:)-U(j,:));
        end
    end
end         

while(steps<=10)
    
    for i=1:n
        for j=1:m
            x=U(i,:)*V(j,:)';
            U(i,:)=U(i,:)-delta*( I(i,j)*C(i)*(x-A(i,j))*V(j,:)+x1*U(i,:) );
            V(j,:)=V(j,:)-delta*( I(i,j)*C(i)*(x-A(i,j))*U(i,:) );
            if i==1
                V(j,:)=V(j,:)-delta*( x1*V(j,:) );
            end
        end
        U(i,:)=U(i,:)-delta*(x2*temp(i,:));
    end
   
    steps=steps+1;
    
end

%J=costFunc(U,V,I,C,A,sim,T,n,m,x1,x2);

end