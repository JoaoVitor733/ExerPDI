im = imread('D:\PDI\rgb.jpg');
 
imR = im;
imG = im;
imB = im; 

 

for l =1 : size(im,1)
  for c=1 : size(im,2)
     if ((im(l,c,1) > 120) && (im(l,c,2) < 120) && (im(l,c,3) < 120))
        imR (l,c,1) = imR (l,c,1); 
        imR (l,c,2) =  imR (l,c,2);
        imR(l,c,3) = imR(l,c,3);
      else
         imR (l,c,:) = 255;
     endif
  endfor
endfor

for l =1 : size(im,1)
  for c=1 : size(im,2)
     if ((im(l,c,1) < 100) && (im(l,c,2) > 100) && (im(l,c,3) < 100))
        imG (l,c,1) = imR (l,c,1); 
        imG (l,c,2) =  imR (l,c,2);
        imG (l,c,3) = imR(l,c,3);
      else
         imG (l,c,:) = 255;
     endif
  endfor
endfor

for l =1 : size(im,1)
  for c=1 : size(im,2)
     if ((im(l,c,1) > 126) && (im(l,c,2) > 126) && (im(l,c,3) < 126))
        imB (l,c,:) = imB(l,c,:); 
      else
        imB (l,c,:) = 255;
     endif
  endfor
endfor


figure(1);
imshow(imR)
figure(2);
imshow(imB)