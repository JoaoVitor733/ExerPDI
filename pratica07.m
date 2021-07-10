
pkg load image;
close all;
clear all;

##%RECEBENDO A IMAGEM
##im = imread('C:\Users\joaov\Documents\desmatamento.jpg');
## 
##
##%TRANSFORMANDO EM TONS DE CINZAS
##imCinza = rgb2gray(im);
##
####figure('Name','magem original: cinza');
####imshow(imCinza)
##
##%CRIANDO UMA MATRIZ PARA RECEBER A IMAGEM EM TONS DE CINZAS SO QUE EM BINARIO
##imBW = logical(zeros(size(im,1),size(im,2)));
##
##%ONDE A INTENSIDADE FOR MAIS QUE 120 RECEBE 1
##imBW(imCinza > 120) = 1;
##
##%variaveis para receber a quantidade de pixeis brancos e pretos
##bra = 0;
##pre = 0;
##
##%contando os pixies
##for l = 1 : size(im,1)
##  for c = 1 : size(im,2) 
##     if((imBW(l,c) == 1))
##       bra += 1;
##      else
##        pre += 1;
##     endif
##  endfor
##endfor
##
##%fazendo o calculo da porcetagem de pixeis branco
##porDes = (bra * 100)/(pre+bra);
##
##%Arredondando o numero para um valor mais proximo sendo inteiro
##y = floor(porDes);
##
##%mostrando a imagem
##figure('Name','imagem desmatada');
##imshow(imBW)
##
##%mostando a porcentagem como titulo da imagem
##title(strcat('percentual de desmatamento =  ',int2str(y)))

%/////////////////////////////////////////////////////////

##im2 = imread('C:\Users\joaov\Documents\degrade.jpg');
##
##figure('Name','imagem original: degrade');
##imshow(im2)
##%log
##C = 1;
##imLog = im2uint8(mat2gray(C*log(1+double(im2))));
##%transformar a imagem em double e somar 1
##%aplicar o logaritmos vezes 1
##%mat2gray tranforma em tons de cinzas
##%passa para uint 8 para podermos ver
##figure('Name','limagem logaritma');
##imshow(imLog)
##
##%potencia
##
##imPot = (double(im2)) .^ 3;
##%tranformar imagem em double e elevar
##imPot = uint8((mat2gray(double(im2)+eps).^3));
##figure('Name','limagem potenciada');
##imshow(imPot)


im3 = imread('C:\Users\joaov\Documents\tomografia.jpg');

figure('Name','imagem original');
imshow(im3)

imFat1 = rgb2gray(im3);

for l = 1 : size(im3,1)
  for c = 1 : size(im3,2)
    if(imFat1(l,c) > 40 && imFat1(l,c) < 110);
       imFat1(l,c) = 200; %pega a região onde e um cinza escuro
     else
         imFat1(l,c) = 50;
    endif
  endfor
endfor

figure('Name','imagem fatiada');
imshow(imFat1)

imFat2 = rgb2gray(im3);

for l = 1 : size(im3,1)
  for c = 1 : size(im3,2)
    if(imFat2(l,c) > 100 && imFat2(l,c) < 170);
       imFat2(l,c) *= 1.5; %pega a região onde e um cinza escuro
     else
         imFat2(l,c) *= 0.3;
    endif
  endfor
endfor

figure('Name','imagem fatiada 2');
imshow(imFat2)



