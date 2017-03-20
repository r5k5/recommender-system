function [C,R_bar] = reputation(A,I,n,m)

ntemp=ones(n,1);
mtemp=ones(m,1);
C=zeros(n,1);
Q=zeros(m,1);
Q_bar=zeros(n,1);
R_bar=zeros(n,1);
Corr=zeros(n,1);
flag=0;

C=(I*mtemp)./m;


while(flag==0)

Q=(A'*C)./(I'*C);
R_bar=(A*mtemp)./(I*mtemp);
Q_bar=(I*Q)./(I*mtemp);

for i=1:n
    Corr(i)=((A(i,:)-R_bar(i)).*I(i,:))*(Q-Q_bar(i));
    Corr(i)=Corr(i)./(sqrt(sum(A(i,:).^2))*sqrt(sum(((Q-Q_bar(i)).*I(i,:)').^2)));
    if isnan(Corr(i))
        Corr(i)=0;
    end
end

C=(Corr+1)/2;

x=0;

for i=1:m
    x=x+( Q(i).^m - Q(i).^(m-1) );
    if isnan(x)
        x=0;
    end
end

x=x/m;

if x<=10^(-6)
    flag=1;
end

end 

for i=1:n
    if isnan(R_bar(i))
        C(i)=0;
    end
end

end






        


    




    
   