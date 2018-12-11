a = 1;
b = 4;

dir = 'CL\';
ext = '.txt';

[cl,dom,num,Psi,U,V,P,cx,cy,X,Y,Circu,Fx,Fy] = deal(cell(b,1));
h = [0.5; 0.001; 0.01; 0.01];
domx = [91 113];
domy = [16 38];

for i = a:b
    path = strcat(dir, num2str(i), '-');
    cl{i} = dlmread(strcat(path,'cl',ext),'\t');
    dom{i} = dlmread(strcat(path,'dom',ext),'\t');
    num{i} = dlmread(strcat(path,'num',ext),'\t');
    
    X{i} = (0:h(i):(size(num{i}, 1) - 1) * h(i))';
    Y{i} = (0:h(i):(size(num{i}, 2) - 1) * h(i))';
end

for i = a:b
    Psi{i} = getPsi(cl{i}, dom{i}, num{i});
    [U{i}, V{i}] = getU(Psi{i}, dom{i}, h(i));
    P{i} = getP(U{i},V{i});
    Circu{i} = getCircu(U{i},V{i}, domx, domy, h(i));
    [Fx{i},Fy{i}] = getForce(P{i}, domx, domy, h(i));
end

for i = a:b
    subplot(2, 2, i);
    pimage = pcolor(X{i},Y{i},Psi{i}'); 
    set(pimage, 'EdgeColor', 'none'); 
    colorbar
    axis xy
    axis equal
end
