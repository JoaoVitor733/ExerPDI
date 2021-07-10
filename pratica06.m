pkg load image;

clear all;
close all;

##%LEITURA DE IMAGEM
##im = imread('C:\Users\joaov\Documents\img_lincoln.jpg');
##
##%CRIANDO UMA EE
##B = uint8(zeros(3,3));
##
##%MOSTRANDO A IMAGEM
####figure('Name','Imagem original: Lincoln.jpg');
####imshow(im)
##
##%TRANSFORMANDO ELEMENTO ESTRUTURAL(EE)
##for l=1 : 2 :  3
##  for c=1 :  2  : 3
##       B(l,c) = 255;
##  endfor
##endfor
##
##
##%TRANSFORMANDO A IMAGEM EM BINARIA
##
##for l=1 : size(im,1)
##  for c=1 : size(im,2)
##     if(im(l,c) < 200)
##        im(l,c,:) = 0;
##     else
##         im(l,c,:) = 255;
##     endif
##  endfor
##endfor
##
##imCopia = im; % DUPLICANDO A IMAGEM
##
##%FAZENDO BORDA EXTERNA
##for l=1 : size(im,1)-1
##  for c=1 : size(im,2)
##    if (B(2,2) != im(l,c)) %ENCONTROU O FOREGROUND
##     if((im(l,c-1) == B(2,1)) && (im(l,c+1) != B(2,3)))
##         im(l,c) = 1;
##      else 
##         if((im(l,c-1) != B(2,1)) && (im(l,c+1) == B(2,3)))
##           im(l,c) = 1;
##         else
##            if((im(l-1,c) == B(1,2)) && (im(l+1,c) != B(3,2)))
##               im(l,c) = 1;
##            else
##               if((im(l-1,c) != B(1,2)) && (im(l+1,c) == B(3,2)))
##                  im(l,c) = 1;
##               endif
##            endif
##         endif 
##       endif
##     endif
##  endfor
##endfor
##
##%pegando a penas a borda
##C = imCopia - im;
##
##%Botando fundo branco no foreground
##for l = 1 : 383
##  for c = 1 : 318
##      if((imCopia(l,c) == 255))
##        C(l,c,:) = 255;
##      endif
##  endfor
##endfor
##
##%MOSTRANDO A BORDA COM FOREGROUND BRANCO
##figure('Name','BORDA EXETERNA');
##imshow(C)

im2 = imread('C:\Users\joaov\Documents\geometrico.jpg');

imBW = im2bw(im2);

B2 = uint8(zeros(3,3));

%DILATAÇÃO
##for l = 1 : size(im2,1)-1
##  for c = 1 : size(im2,2)-1
##      if (imBW(l,c))
##       if((imBW(l+1,c)) && (!imBW(l,c+1)) && (!imBW(l+1,c+1)) &&(!imBW(l,c)))
##         imBW(l+1,c) =0;
##       else
##         if((!imBW(l+1,c)) && (imBW(l,c+1))&&(!imBW(l+1,c+1))&&(!imBW(l,c)))
##            imBW(l,c+1) = 0;
##         else
##            if((!imBW(l+1,c)) && (!imBW(l,c+1))&& (imBW(l+1,c+1))&&(!imBW(l,c)))
##               imBW(l+1,c+1) =0;
##              else
##                 if((!imBW(l+1,c)) && (!imBW(l,c+1))&& (!imBW(l+1,c+1))&&(imBW(l,c)))
##                   imBW(l,c)  = 0;
##                  endif
##               endif
##             endif
##        endif
##     endif
##  endfor
##endfor

%EROSÃO
for l = 1 : size(im2,1)-1
  for c = 1 : size(im2,2)-1
      if (!imBW(l,c))
       if((!imBW(l+1,c)) && (imBW(l,c+1)) && (imBW(l+1,c+1)) &&(imBW(l,c-1)))
         imBW(l+1,c) =1;
       else
         if((imBW(l+1,c)) && (!imBW(l,c+1))&&(imBW(l+1,c+1))&&(imBW(l,c-1)))
            imBW(l,c+1) = 1;
         else
            if((imBW(l+1,c)) && (imBW(l,c+1))&& (!imBW(l+1,c+1))&&(imBW(l,c-1)))
               imBW(l+1,c+1) =1;
              else
                 if((imBW(l+1,c)) && (imBW(l,c+1))&& (imBW(l+1,c+1))&&(!imBW(l,c-1)))
                   imBW(l,c)  = 1;
                  endif
               endif
             endif
        endif
     endif
  endfor
endfor



figure('Name','Imagem original: Geométrico.jpg');
imshow(imBW)
