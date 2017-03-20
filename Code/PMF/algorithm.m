function [U,V] = algorithm(I,A,n,m)

[U,V,delta,x1]=parameters();

steps=1;

while(steps<=10)
    
    for i=1:n
        for j=1:m
            x=U(i,:)*V(j,:)';
            U(i,:)=U(i,:)-delta*( I(i,j)*(x-A(i,j))*V(j,:) );
            V(j,:)=V(j,:)-delta*( I(i,j)*(x-A(i,j))*U(i,:) );
            if i==1
                V(j,:)=V(j,:)-delta*( x1*V(j,:) );
            end
        end
        U(i,:)=U(i,:)-delta*( x1*U(i,:) );
    end
   
    steps=steps+1;
    
end

%J=costFunc(U,V,I,C,A,sim,T,n,m,x1,x2);

end