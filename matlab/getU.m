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

