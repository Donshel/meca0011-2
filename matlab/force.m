function [fx,fy] = force(p,x,y)   
    fx = -trapz(y,p);
    fy = trapz(x,p);       
end

