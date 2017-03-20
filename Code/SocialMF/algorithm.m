function [U,V] = algorithm(I,A,T,n,m)

[U,V,k,delta,x1,x2]=parameters();

steps=1;
temp=zeros(n,k);
temp0=zeros(n,k);
temp1=zeros(1,k);

for i=1:n
    for j=1:n
        if T(i,j)==1
            temp(i,:)=temp(i,:)+U(j,:);
        end
    end
    temp(i,:)=U(i,:)-temp(i,:);
end

for i=1:n
    for j=1:n
        if T(j,i)==1
            for p=1:n
                if T(j,p)==1
                    temp1=temp1+U(p,:);
                end
            end
        end
        temp0(i,:)=temp0(i,:)+(U(j,:)-temp1);
        temp1(:)=0;
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
        U(i,:)=U(i,:)-delta*(x2*temp(i,:)-x2*temp0(i,:)+x1*U(i,:));
    end
   
    steps=steps+1;
    
end

%J=costFunc(U,V,I,C,A,sim,T,n,m,x1,x2);

end