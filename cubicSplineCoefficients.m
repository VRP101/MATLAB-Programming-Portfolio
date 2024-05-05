function p = cubicSplineCoefficients(x,y)
    n = size(x,2);
    pieces=n-1;
    order=4;
    dim=1;
    breaks=x;
    form = 'pp';
    b = zeros(n,1);
    % step 1: Formulate RHS
    for i = 1:n
        if i==1
            b(i)=y(2)-y(1);
        elseif i>1 && i<n
            b(i)=y(i+1)-y(i-1);
        else
            b(i)=y(i)-y(i-1);
        end
    end
    b = b*3;
    % step 2: Formulate D matrix with dimensions (n,n)
    A = zeros(n,n);
    for i = 1:n
        for j=1:n
            if i==j % for main diagonal
                A(i,i)=4;
                if i>1
                    A(i,i-1)=1;% Lower diagonal
                end
                if i<n
                    A(i,i+1)=1;% upper diagonal
                end
            end
        end
    end
    D(1,1)=2;
    D(n,n)=2;
   % step3: get D vector
   D = A\b;
   coefs = [];
   for k = 1:n-1
        x_new = 0.5*(x(k)+x(k+1));
        for i = 1:n-1
            if x_new<=x(i+1) && x_new>=x(i)
                p = i; 
                break
            end
            if x_new<x(1) 
                p=1;
            end
            if x_new>x(n) 
                p=n-1;
            end
        end
        for i = 1:n-1
             if p==i     
               a = (2*(y(i)-y(i+1))+D(i)+D(i+1))/(x(i+1)-x(i))^3;
               b = (3*(y(i+1)-y(i))-2*D(i)-D(i+1))/(x(i+1)-x(i))^2;
               c = D(i)/(x(i+1)-x(i));
               d = y(i);
               coefs = [coefs;[a,b,c,d]];
             end
        end
    end
    p = struct('form',form,'breaks',breaks,'coefs',coefs,'pieces',pieces,'order',order,'dim',dim);
end