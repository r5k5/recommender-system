function [A,I,T,d_in,d_out,n,m] = initialize()

load('uir.txt');
load('social.txt');
n=max(uir(:,1));    %no of users
m=max(uir(:,2));    %no of distinct items
A = zeros(n,m);
I=zeros(n,m);
T=zeros(n,n);
d_in=zeros(n);
d_out=zeros(n);

for i=1:size(uir,1)
    A(uir(i,1),uir(i,2))=uir(i,3)/4;
end

for i=1:n
    for j=1:m
        if A(i,j)>0
            I(i,j)=1;
        end
    end
end

for i=1:size(social,1)
    T(social(i,1),social(i,2))=1;
    d_out(social(i,1))=d_out(social(i,1))+1;
    d_in(social(i,2))=d_in(social(i,2))+1;
end

end