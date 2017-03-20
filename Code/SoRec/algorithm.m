function [U,V] = algorithm(I,A,T,d_in,d_out,n,m)

[U,V,Z,k,delta,x1,x2]=parameters();

steps=1;
temp=zeros(n,k);
temp0=zeros(n,k);

for i=1:n
    for j=1:n
        T(i,j)=sqrt(d_in(j)/(d_out(i)+d_in(j)))*T(i,j);
        if isnan(T(i,j))
            T(i,j)=0;
        end
    end
end

for i=1:n
    for j=1:n
        x=U(i,:)*Z(j,:)';
        temp(i,:)=temp(i,:)+I(i,j)*gd(x)*(g(x)-T(i,j))*Z(j,:);
    end
end

for p=1:n
    for i=1:n
        x=U(i,:)*Z(p,:)';
        temp0(i,:)=temp0(i,:)+I(i,p)*gd(x)*(g(x)-T(i,p))*U(i,:);
    end
end

while(steps<=10)
    
    for i=1:n
        for j=1:m
            x=U(i,:)*V(j,:)';
            U(i,:)=U(i,:)-delta*( I(i,j)*gd(x)*(g(x)-A(i,j))*V(j,:) );
            V(j,:)=V(j,:)-delta*( I(i,j)*gd(x)*(g(x)-A(i,j))*U(i,:) );
            if i==1
                V(j,:)=V(j,:)-delta*( x1*V(j,:) );
            end
        end
        U(i,:)=U(i,:)-delta*(x2*temp(i,:)+x1*U(i,:));
        Z(i,:)=Z(i,:)-delta*(x2*temp0(i,:)+x1*Z(i,:));
    end
   
    steps=steps+1;
    
end

%J=costFunc(U,V,I,C,A,sim,T,n,m,x1,x2);

end