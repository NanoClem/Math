//DECOOPMAN Clément


//EXERCICE 1

//1
img0 = imread('D:\Git\Math\Math IN\Cin\TP04\lena.pgm');


function viewSobel(S, n)
    plot3d(1:n, 1:n, S);
endfunction


//2
function res = grad(img)
    img = double(img);
    
    Sx   = fspecial('sobel');
    Sy   = Sx';
     
    Ix = imfilter(img, Sx);
    Iy = imfilter(img, Sy);
    
    X = sqrt(Ix .^2 + Iy .^2);
    res = uint8(255*mat2gray(X));
endfunction


//3
function res = seuillage(X)
    X = uint8(X);
    X(X<127) = 0;
    res = uint8(255*mat2gray(X));
endfunction






//EXERCICE 2


//1
img1 = imread('D:\Git\Math\Math IN\Cin\TP04\coins.pgm');
X1 = img1;



//2

//Afficher l'histogramme d'une image
function res = imgHist(img)
    [counts, cells] = imhist( uint8(img) );
    plot(cells, counts);
    res = %t;
endfunction

// On observe des pics aux valeurs 70 et 180
// Le pic 70 correspond aux pièces et 180 au fond


//3
// D'après l'Histogramme, Tmin = 80 et Tmax = 230


//4
function res = bin1(X, Tmin, Tmax)
    Xbin = uint8(X);
    
    Xbin(Tmin<Xbin) = 255;
    Xbin(Xbin<Tmin) = 0;
    
    res = Xbin;
endfunction


//5
// Tmin = 80 et Tmax = 230 sont de bonnes valeurs


//6
//Filtre médian
function res = AverageFilter(img, filtSize)
    img = double(img);
    F = fspecial('average', filtSize);
    res = uint8(imfilter(img, F));
endfunction






//EXERCICE 3

//1
Y = img1 //L'image des pièces

//2
Y1 = grad(Y);

//3
//imgHist(Y1);  // d'après l'histogramme du gradient de Y1, le seuil est à environ 50

//4
function Ybin = bin2(Y, T)
    Y = uint8(Y);
    Y(Y>T) = 255;
    Y(Y<T) = 0;
    
    Ybin = Y;
endfunction






//EXERCICE 4

//1
Z = img1 = imread('D:\Git\Math\Math IN\Cin\TP04\coins.pgm');

//2
Z1 = bin1(Z, 80, 230);

//3
Zbin = bin2(double(Z1), 100);

//4
imshow([Z1 Zbin]);












