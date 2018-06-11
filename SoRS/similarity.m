function [sim] = similarity(A,R_bar,T,n,m)

sim=zeros(n,n);
sim_num=zeros(n,n);
sim_den1=zeros(n,n);
sim_den2=zeros(n,n);
freq=zeros(n,n);

for i=1:n
    for j=1:n
        if T(i,j)==1
        count=0;
        for k=1:m
            if A(j,k)>0 && A(i,k)>0
                count=count+1;
                sim_num(i,j)=sim_num(i,j)+( A(j,k)-R_bar(j) )*( A(i,k)-R_bar(i) );
                sim_den1(i,j)=sim_den1(i,j)+( A(j,k)-R_bar(j) )^2;
                sim_den2(i,j)=sim_den2(i,j)+( A(i,k)-R_bar(i) )^2;
            end
        end
        freq(i,j)=count;
        end
    end
end

for i=1:n
    for j=1:n
        if T(i,j)==1
            sim(i,j)=sim_num(i,j)/( sqrt(sim_den1(i,j))*sqrt(sim_den2(i,j)) );
        end
    end
end

for i=1:n
    for j=1:n
        if T(i,j)==1
            sim(i,j)=(sim(i,j)+1)/(2*(1+exp(-freq(i,j)/2)));
        end
        if isnan( sim(i,j) )
            sim(i,j)=0;
        end
    end
end

end     