function c = getCircu(U, V, cx, cy, h)
    
    xmax = max(cx);
    xmin = min(cx);
    ymax = max(cy);
    ymin = min(cy);
    
    if (xmax > size(U, 1) - 1 || xmin < 1 || ymax > size(U, 2) - 1 || ymin < 1)
        c = NaN;
        return;
    end
  
    x = [xmin:xmax, ones(1,ymax-ymin-1) * xmax, fliplr(xmin:xmax), ones(1,ymax-ymin) * xmin]';
    y = [ones(1,xmax-xmin) * ymin, ymin:ymax, ones(1,xmax-xmin-1) * ymax, fliplr(ymin:ymax)]';
    
    [u,v] = deal(length(x));
    
    for i = 1:length(x)
        u(i) = U(x(i),y(i));
        v(i) = V(x(i),y(i));
    end
    
    x = (x-1) * h;
    y = (y-1) * h;
    
    c = -circu(u,v,x,y);
end

