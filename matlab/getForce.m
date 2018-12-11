function [fx,fy] = getForce(P, cx, cy, h)
       
    xmax = max(cx);
    xmin = min(cx);
    ymax = max(cy);
    ymin = min(cy);
    
    if (xmax > size(P, 1) - 1 || xmin < 1 || ymax > size(P, 2) - 1 || ymin < 1)
        [fx,fy] = deal(NaN);
        return;
    end
  
    x = [xmin:xmax, ones(1,ymax-ymin-1) * xmax, fliplr(xmin:xmax), ones(1,ymax-ymin) * xmin]';
    y = [ones(1,xmax-xmin) * ymin, ymin:ymax, ones(1,xmax-xmin-1) * ymax, fliplr(ymin:ymax)]';

    p = zeros(length(x),1);
    
    for i = 1:length(x)
        p(i) = P(x(i),y(i));
    end
    
    x = (x - 1) * h;
    y = (y - 1) * h;
        
    [fx,fy] = force(p,x,y);
    
end

