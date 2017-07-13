function [A,I,T,n,m] = initialize()

load('filmtrust/rating.txt');
load('filmtrust/social.txt');
n=max(rating(:,1));    %no of users
m=max(rating(:,2));    %no of distinct items
A = zeros(n,m);
I=zeros(n,m);
T=zeros(n,n);

for i=1:size(social,1)
    T(social(i,1),social(i,2))=1;
end

for i=1:size(rating,1)
    A(rating(i,1),rating(i,2))=rating(i,3);
end

for i=1:n
    for j=1:m
        if A(i,j)>0
            I(i,j)=1;
        end
    end
end

end