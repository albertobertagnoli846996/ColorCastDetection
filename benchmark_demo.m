clear all
clc
tic

folder = '.\Test'; 
%%
filepaths = dir(fullfile(folder, '*.png'));
disp(filepaths);

%Impostare un parametro di thrashold per la texture
%in scala di girigi. Questo filtro regola il grado con
%cui vengono filtrate le immagini di falsi color cast.

TextureTH = 10;


T = zeros(length(filepaths),1);
for i = 1:length(filepaths)
   disp(i);
   I = imread(fullfile(folder, filepaths(i).name));
   %imshow(I);
   T(i) = CastFactorK1(I,TextureTH);
   if T(i) > 100
       movefile(fullfile(folder, filepaths(i).name), '.\ColorCasting_Images');
   end
   
end


toc