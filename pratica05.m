pkg load image;

clear all;
close all;

%importando a imagem lena
im = imread('C:\Users\joaov\Documents\lena_.png'); 

%mostrando imagem lena
##figure('Name','Imagem original: Lena.jpg'); 
##imshow(im);

%atribuindo a nova variavel a imagem lena em tons de cinzas
imCinza = (0.3*im(:,:,1)) +(0.59*im(:,:,2))+(0.11*im(:,:,3)); 

%REDUÇÃO DE IMAGEM
 
x =1; %linha que vai ate 256
 for l = 1 : 2 :  512 %aparti da linha 1 a proxima será a 3, ou seja, de dois em dois
     y = 1;  %coluna que vai ate 256
   for c = 1 : 2 : 512
       imPeq(x,y) = imCinza(l,c); %atribuindo 1/4 da imagem cinza
     y = y+1;
   endfor
   x=x+1;
 endfor 
 
##figure(5); %mostrando a imagem reduzida
##imshow(imPeq);

%AMPLIAÇÃO

x = 1;
for l=1 : 256
   y = 1;
  for c=1 : 256
    imApliada(x,y) = imPeq(l,c); % imagem com espaços em brancos e não alternando para a imagem voltar a tamanho original
    y += 2;
  endfor
  x = x + 2;
endfor

##figure(4);
##imshow( imApliada)

%INTERPOLAÇÃO POR VIZINHOS MAIS PROXIMOS

vizinInter = imApliada; %duplicando a imagem apliada

%linhas que são completamente pretas
for l = 2 : 2 : 512
  for c = 2: 2  : 511
      vizinInter(l,c) = vizinInter(l-1,c-1); %se pixel e preto pega o pixel da diagonal esquerda
      vizinInter(l,c+1) = vizinInter(l-1,c+1);%se pixel e preto pega o pixel de cima dele
  endfor
endfor

%linhas alternadas com valores e sem
for l=1 : 2 : 512
  for c=2 : 2 : 512
     vizinInter(l,c) = vizinInter(l,c-1);%pixel preto recebe o valor da esquerda
  endfor
endfor

%pixeis da primeira e ultima coluna recebendo valores
for l=2 : 2 : 512
    vizinInter(l,1) = vizinInter(l-1,1);
    vizinInter(l,512) = vizinInter(l-1,512);
endfor

##figure(8);
##imshow(vizinInter)

%interpolação bilenear

imBilinear = imApliada; %duplicando a imagem ampliada

%interpolando as linhas que não possui nem um valor(0)
for l = 2 : 2: 511
  for c = 2 : 2: 511
    imBilinear(l,c) = (imBilinear(l-1,c-1)+imBilinear(l-1,c+1)+imBilinear(l+1,c-1)+imBilinear(l+1,c+1))/4; %quando o quadrado e preto,mas suas diagonais possuem valores
    imBilinear(l,c+1) = (imBilinear (l-1,c)+imBilinear (l+1,c))/2; %quanto o pixel e zero e so tem valores nos pixeis de cima e baixo
  endfor
endfor

%interpolando nas linhas que possui pixeis alternados(com e sem valor)
for l =1 : 2 : 512
  for c = 2 : 2 : 511
    imBilinear(l,c) = (imBilinear(l,c-1)+imBilinear(l,c+1))/2;
  endfor
endfor

%interpolando a primeira e ultima coluna
for l=2 : 511
  for c=1 : 512
    if((imBilinear (l,c) == 0))
      imBilinear(l,c) = (imBilinear(l-1,c)+imBilinear(l+1,c))/2;
    endif
  endfor
endfor

figure(6);
imshow(imBilinear)

