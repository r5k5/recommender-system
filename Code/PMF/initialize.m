function [A,I,n,m] = initialize()

load('filmtrust/rating.txt');

n=max(rating(:,1));     %no of users
m=max(rating(:,2));     %no of distinct items
A = zeros(n,m);         %user-item rating matrix
I=zeros(n,m);

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