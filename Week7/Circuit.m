function [A, b] = Circuit(n)
    % -6*x_{k} + 7*x_{k+1} + (x_{k+2} + x_{k+3} + ... + x_{n}) = 0
    A = zeros(n+1, n+1);
    b = zeros(n+1, 1);
    b(n+1) = 18;
    % Fill in the matrix A according to the recursive relation
    for k = 2:n
        A(k, k) = -6;
        A(k, k+1) = 7;
        if k+2 <= n+1
            A(k, k+2:n+1) = 1;
        end
    end
    A(1,1)=1;
    A(1,2:n+1)=-1;
    A(n+1,1)=1;
    A(n+1,2)=6;
end