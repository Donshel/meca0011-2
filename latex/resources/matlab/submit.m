function [Psi,U,V] = submit(w)
    dir = '';
    ext = '.txt';
    h = [0.5; 0.001; 0.01; 0.01];

    path = strcat(dir, num2str(w), '-');
    cl = dlmread(strcat(path,'cl',ext),'\t');
    dom = dlmread(strcat(path,'dom',ext),'\t');
    num = dlmread(strcat(path,'num',ext),'\t');

    Psi = getPsi(cl, dom, num);
    [U, V] = getU(Psi, dom, h(w));
end

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

function [U, V] = getU(mat, dom, h)
    dim = size(mat);
    [U,V] = deal(zeros(dim));
    
    for i = 1:dim(1)
        for j = 1:dim(2)
            if (dom(i, j) ~= 0)
                V(i,j) = -deriv(mat(i-1,j), mat(i,j), mat(i+1,j), dom(i-1,j), dom(i,j), dom(i+1,j), h);
                U(i,j) = deriv(mat(i,j-1), mat(i,j), mat(i,j+1), dom(i,j-1), dom(i,j), dom(i,j+1), h);
            else
                V(i,j) = NaN;
                U(i,j) = NaN;
            end
        end
    end
end

function [j, a, b] = getCoeff(num_left, num_right, num_down, num_up, num_cent, type_cent, cl_cent)
    
    j = [];
    a = [];
    b = 0;
    
    if (type_cent == 1)
        j = [num_left; num_right; num_down; num_up; num_cent];
        a = ones(5, 1);
        a(5) = -4;
    elseif (type_cent == 2)
        j = num_cent;
        a = 1;
        b = cl_cent;
    end
        
end
    
function v = deriv(f_left, f_c, f_right, type_left, type_c, type_right, h)
    v = NaN;
    
    if (type_c ~= 0)
        if (type_left ~= 0)
            if (type_right ~= 0)
                v = (f_right - f_left) / (2 * h);
            else
                v = (f_c - f_left) / h;
            end
        else
            if (type_right ~= 0)
                v = (f_right - f_c) / h;
            end
        end
    end
end