function [A,R_bar,I,T,n,m] = initialize()

load('uir.txt');
load('social.txt');

n=max(uir(:,1));    %no of users
m=max(uir(:,2));    %no of distinct items
A = zeros(n,m);
mtemp=ones(m,1);
I=zeros(n,m);
T=zeros(n,n);

for i=1:size(social,1)
    T(social(i,1),social(i,2))=1;
end

for i=1:size(uir,1)
    A(uir(i,1),uir(i,2))=uir(i,3);
end

for i=1:n
    for j=1:m
        if A(i,j)>0
            I(i,j)=1;
        end
    end
end

R_bar=(A*mtemp)./(I*mtemp);

end