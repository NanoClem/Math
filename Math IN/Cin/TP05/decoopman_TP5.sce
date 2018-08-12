//DECOOPMAN Clément TP5



//EXERCICE 1


//1.

img0 = imread('D:\Git\Math\Math IN\Cin\TP05\Bali.pgm');


//Norme 1
function z = n1(x, y)
    z = abs(x) + abs(y);
endfunction

// Norme euclidienne
function z = n2(x, y)
    z = sqrt((x).^2+(y).^2);
endfunction

//Norme inf
function z = ninf(x, y)
    xy = [abs(x), abs(y)];
    z = max(xy);
endfunction


//2.
// r = rayon du masque ;  n = type de norme ;  centre(xc, yc)
function res = masque(img, xc, yc, r, n)
    [m,p] = size(img);
    x = [1:m];          //liste des coordonnées x
    y = [1:p];          //liste des coordonnées y
    mask = bool2s(feval(x-xc, y-yc, n) > r);    //masque de rayon r autour de (xc; yc)
    //imshow(uint8(255*mask));    //affichage du masque
    res = img.*mask;
endfunction



//3.
//norme 1 : un losange
//norme 2 : un rond
//norme inf : un carré




//EXERCICE 2

img1 = imread('D:\Git\Math\Math IN\Cin\TP05\lena_bruit.pgm');


function res = PasseBas(img, r, n)
    img = double(img);
    [xn,yn] = size(img);
    xc = xn/2;
    yc = yn/2;
    
    imgF = fft2(img);           //Transformée de Fourrier
    imgF2 = imgF.*masque(img, xc, yc, r, n);  //On applique le masque
    
    imgF3 = ifft(imgF2);        //Transformée de Fourrier inverse
    imgF4 = real(imgF3);        //On prends la partie réelle
    res = uint8(imgF4);
endfunction







//EXERCICE 3

img2 = imread('D:\Git\Math\Math IN\Cin\TP05\lena.pgm');

//1.
function res = PasseHaut(img, r, n)
    img = double(img);
    [xn,yn] = size(img);
    xc = xn/2;
    yc = yn/2;
    
    imgF = fft2(img);           //Transformée de Fourrier
    imgF2 = fftshift(imgF);     //On ramène les basses fréquences au centre
    
    imgF3 = imgF2.*masque(img, xc, yc, r, n);  //On applique le masque
    
    imgF4 = fftshift(imgF3);    //On remet les cadrant sur les côtés
    imgF5 = ifft(imgF4);        //Transformée de Fourrier inverse
    imgF6 = real(imgF5);        //On prends la partie réelle
    res = uint8(imgF6);
endfunction






//EXERCICE 4

//1.
Bali = imread('D:\Git\Math\Math IN\Cin\TP05\Bali.pgm');
Depardieu = imread('D:\Git\Math\Math IN\Cin\TP05\depardieu.pgm');

//2.
//img0 : l'image que l'on veut cacher
//img1 : l'image dans laquelle on cache
function res = cacheMot(img0, img1, n)
    img1Bas  = PasseBas(img1, 20, n);
    img0Haut = PasseBas(img0, 20, n);
    imgF = img1Bas + img0Haut;
    res = uint8(imgF);
endfunction











