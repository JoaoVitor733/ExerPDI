%{
im = zeros(50,255);
im = uint8(im);
 
for c=1 : size(im,2)
   im (:,c) = c; 
endfor
 
figure(1)
imshow(im)
%}
im = imread ('C:\Users\joaov\Pictures\lena_.png');

gray = (0.3*im(:,:,1)) +(0.59*im(:,:,2))+(0.11*im(:,:,3));

for c=1 :  size(im,1)/2
  grayDe(:,257-c) = gray(:,257-c) - c;
endfor

aux = 0;
for c=size(im,2)/2 : size(im,2)
    grayDe(:,c) = gray(:,c) + aux; 
    aux = aux+1;
endfor
%{
grayBran = gray;
graycin = gray;
  
for l=1 : size(im,1)
  for c=1 : size(im,2)
   grayBran (l,c) = uint8(gray(l,c)*1.4);
   graycin (l,c) = uint8(gray(l,c)*0.4);
  end
 end
%}

grayBran (:,:) =  uint8(gray(:,:)*1.4);
graycin (:,:) =  uint8(gray(:,:)*0.4);

figure(1);
imshow(grayDe)
figure(2);
imshow(grayBran)
figure(3);
imshow(graycin)