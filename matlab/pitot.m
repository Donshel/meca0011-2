main;
close;

i = 2;
[~,x] = min(abs(U{i}(2:end-1,2)));
x = x + 1;

psi = Psi{i};

line = Psi(:,2);
psi(Psi{i} < Psi{i}(x,2)) = NaN;
psi(:,2) = NaN(size(Psi{i},1),1);
psi(2:81,2) = line(2:81);

pimage = pcolor(X{i},Y{i},psi'); set(pimage, 'EdgeColor', 'none'); colorbar
axis xy
axis equal

% Uinf = 4;
% Q = 0.5;
% 
% x0 = (101.5 - 1) * h{i};
% y0 = (2 - 1) * h{i};
% 
% f_Psi = @(x,y) Uinf * y + Q * atan((y - y0)/(x - x0)) / 2 /pi;
% f_u = @(x,y) Uinf + Q / 2 /pi * (x - x0) / ((x - x0).^2 + (y - y0).^2);
% f_v = @(x,y) Q / 2 /pi * (y - y0) / ((x - x0).^2 + (y - y0).^2);
% 
% [PsiAnaly,UAnaly,VAnaly] = deal(zeros(size(X{i},1),size(Y{i},1)));
% 
% for j = 1:size(X{i},1)
%     for k = 1:size(Y{i},1)
%         if (dom{i}(j,k) ~= 0)
%             PsiAnaly(j,k) = f_Psi(X{i}(j),Y{i}(k));
%             UAnaly(j,k) = f_u(X{i}(j),Y{i}(k));
%             VAnaly(j,k) = f_v(X{i}(j),Y{i}(k));
%         else
%             PsiAnaly(j,k) = NaN;
%             UAnaly(j,k) = NaN;
%             VAnaly(j,k) = NaN;
%         end
%     end
% end
% 
% subplot(2, 2, 1);
% [A,B] = contour(X{i},Y{i},Psi{i}','LevelStep',0.025); colorbar
% title('Lignes de courant pour le modèle numérique');
% axis xy
% axis equal
% 
% subplot(2, 2, 2);
% contour(X{i},Y{i},PsiAnaly','LevelStep',0.025); colorbar
% title('Lignes de courant pour le modèle analytique');
% axis xy
% axis equal
% 
% subplot(2, 2, 3);
% contour(X{i},Y{i},U{i}','LevelStep',1,'fill','on'); colorbar
% title('Vitesse pour le modèle numérique');
% axis xy
% axis equal
% 
% subplot(2, 2, 4);
% contour(X{i},Y{i},UAnaly','LevelStep',1,'fill','on'); colorbar
% title('Vitesse pour le modèle analytique');
% axis xy
% axis equal

