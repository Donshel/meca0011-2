function Psi = getPsi(cl, dom, num)
    
    dim = size(num);
    
    p = zeros(2,1);
    
    for i = 2:dim(1) - 1
        for j = 2:dim(2) - 1
            if (dom(i, j) ~= 0)
                p(dom(i,j)) = p(dom(i,j)) + 1;
            end
        end
    end
    
    b = zeros(p(1) + p(2), 1);
    [A1,A2,Av] = deal(zeros(5 * p(1) + p(2), 1));
    iA = 1;
    
    for i = 2:dim(1) - 1
        for j = 2:dim(2) - 1
            num_cent = num(i,j);
            if (dom(i, j) ~= 0)
                [x, y, z] = getCoeff(num(i, j - 1), num(i, j + 1), num(i + 1, j), num(i - 1, j), num_cent, dom(i, j), cl(i, j));
                b(num_cent) = z;
                l = length(x);
                A1(iA:iA + l - 1) = ones(l, 1) * num_cent;
                A2(iA:iA + l - 1) = x;
                Av(iA:iA + l - 1) = y;
                iA = iA + l;
            end
        end
    end
    
    A = sparse(A1, A2, Av);
    
    s = A\b;
    Psi = zeros(dim);
    
    for i = 1:dim(1)
        for j = 1:dim(2)
            if (dom(i, j) ~= 0)
                Psi(i,j) = s(num(i,j));
            else
                Psi(i,j) = NaN;
            end
        end
    end
    
end