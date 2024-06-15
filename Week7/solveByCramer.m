function x = solveByCramer(A, b)
    n = length(b);
    x = zeros(n, 1);
    detA = det(A);

    for i = 1:n
        Ai = A;
        Ai(:,i) = b;
        x(i) = det(Ai) / detA;
    end
end