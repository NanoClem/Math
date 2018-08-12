// DECOOPMAN Clément TP02



//EXERCICE 1

img0 = imread('D:\Git\Math\Math IN\Cin\TP02\lena.pgm');
function res = imgHist(img)
    [counts, cells] = imhist( uint8(img) );
    plot(cells, counts);
endfunction

//count : tableau d'effectif de pixel dont chaque valeur de pixel est égale à cells
//cells : valeur du niveau de gris (variant)



//3

function res = imgToNeg(img)
    img = double(img);
    [m,n] = size(img);
    imgNeg = img;
    
    for i = 1:m
        for j = 1:n
            imgNeg(i,j) = 255 - img(i,j);
        end
    end
    
    res = uint8(imgNeg);
endfunction

//img_test = imgToNeg(img0);
//imshow(img_test);





//4

function res = teinte(img, h)
    img = double(img);
    
    if (h < -255 | h > 255) then
        disp("h pas compris dans [-255; 255]");
        res = %f
    else
        [m,n] = size(img);
        X = img;
        for i = 1:m
            for j = 1:n
                X(i,j) = X(i,j) + h;
            end
        end
        X(X<0) = 0;
        X(X>255) = 255;
        res = uint8(X);
    end
endfunction


//img_test2 = teinte(img0, 255);
//imshow(img_test2);






//EXERCICE 2



//1

function res = recadrage(img)
    img = double(img);
    [m,n] = size(img);
    X = img;
    LUT = zeros(1,256);
    
    //LUT
    for i = 1:256
        LUT(i) = ( 255/( max(img)-min(img) )) * (i-min(img));
    end
    
    //recadrage 
    for i = 1:m
        for j = 1:n
            X(i,j) = LUT(img(i,j)+1);   //car le niveau de gris des pixels commence à 0 et LUT(0) n'existe pas
        end
    end
    
    X(X<0) = 0;
    X(X>255) = 255;
    res = uint8(X);
endfunction



//2

img1 = imread('D:\Git\Math\Math IN\Cin\TP02\hotel-de-ville.pgm');
//img_test3 = recadrage(img1);
//imshow(img_test3);







//EXERCICE 3


//1

function res = egalisation(img)
    img = double(img);
    [m,n] = size(img);
    X = img;
    
    //Histogramme cumulé
    [counts, cells] = imhist(uint8(img));   //count : tableau d'effectifs
    HC = [counts(1)];
    for i = 2:256
        HC = [HC, HC(i-1)+counts(i)]
    end
    
    //LUT
    LUT = zeros(1,256);
    for i = 1:256
        LUT(i) = ( 256/(m*n) ) * HC(i) - 1;
    end
    
    //egalisation
    for i = 1:m
        for j = 1:n
            X(i,j) = LUT(img(i,j)+1);
        end
    end
    
    X(X<0) = 0;
    X(X>255) = 255;
    res = uint8(X);
endfunction


img2 = imread('D:\Git\Math\Math IN\Cin\TP02\port.pgm');
//img_test4 = egalisation(img2);
//imshow(img_test4);







//EXERCICE 4


//1
I1 = imread('D:\Git\Math\Math IN\Cin\TP02\cameraman.pgm');
info = imfinfo('D:\Git\Math\Math IN\Cin\TP02\cameraman.pgm');     //informations de l'image
//imshow(I1);
// On peut observer qu'il y a un pic de pixels pour les valeurs de gris appartenant à [0;10] et [150;170]
//imgHist(I1);


//2
I2 = floor(I1 ./2^(8-6));
//imshow(I2);
// Les pics de pixels se trouvent aux mêmes endroits que pour l'histogramme de I1
//imgHist(I1);


//3
I3 = floor(I1 ./2^(8-4));
//imshow(I3);
// L'histogramme n'est plus autant étalé que celui de I1, l'image est assombrie. L'histogramme de I3 est compacte vers les valeurs de gris basses
//imgHist(I3);


//4

I4 = abs(I3-I1);
//On obtient l'image I1 en négatif
//imshow(I4);
//imgHist(I4);

















