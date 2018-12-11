function P = getP(U,V)
    ro = 1000;
    P = ro * -(U.^2 + V.^2)/2;
end

