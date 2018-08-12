// TP03 : DECOOPMAN Clément


//EXERCICE 1


//1
img0 = imread('D:\Git\Math\Math IN\Cin\TP03\lena.pgm');
img1 = imread('D:\Git\Math\Math IN\Cin\TP03\lena_bruit.pgm');


//2

//Afficher l'histogramme d'une image
function res = imgHist(img)
    [counts, cells] = imhist( uint8(img) );
    plot(cells, counts);
    res = %t;
endfunction

//imgHist(img0);
//imgHist(img1);


//Calculer la luminance et le contraste d'une image
function res = LumiAndContr(img)
    img = double(img);
    res = [uint8(mean(img)), uint8(stdev(img)) ];
endfunction

img0_data = LumiAndContr(img0);



//3

img1_data = LumiAndContr(img1);
//le niveau de gris moyen est plus élevé que celui de l'image non bruitée



//4
//5
function res = SNR(img0, img1)
    img0 = double(img0);
    img1 = double(img1);
    res = 20*log10(sum(img0.^2)/sum((img1-img0).^2));
endfunction

SNR_lena = SNR(img0, img1);






//EXERCICE 2

function res = GaussNoise(img, p)
    img = double(img);
    gauss  = 1+p*grand(img, 'unf', -1, 1);
    imgRes = img.*gauss;
    imgRes = max(imgRes,0);
    imgRes = min(imgRes,255);
    res = uint8(imgRes);
endfunction


//1
img     = GaussNoise(img0, 0.2);
SNR_img = SNR(img0, img);


//2
img2     = GaussNoise(img0, 0.5);
SNR_img2 = SNR(img0, img2);

//le SNR pour l'image bruitée à 50% est plus petit que celui de l'image bruitée à 20%



//3
function res = binaryNoise(img, p)
    img = double(img);
    binary = grand(img, 'bin', 1, p);
    imgRes = max(img, 255*binary);
    res = uint8(imgRes);
endfunction


img3     = binaryNoise(img0, 0.1);
SNR_img3 = SNR(img3);




//4





//EXERCICE 3


//1
function res = AverageFilter(img, filtSize)
    img = double(img);
    F = fspecial('average', filtSize);
    res = uint8(imfilter(img, F));
endfunction


average_img2 = AverageFilter(img2, 3);
average_img3 = AverageFilter(img3, 3);


//le filtre moyen semble mieux marcher pour le bruit linéaire




//2
function res = GaussFilter(img, filtSize)
    img = double(img);
    F = fspecial('gaussian', filtSize);
    res = uint8(imfilter(img, F));
endfunction


//Vérifier la somme des coef de F
function res = checkCoef(F)
    [m,n] = size(F);
    sumCoef = 0;
    for i = 1:m
        for j = 1:n
            sumCoef = sumCoef + F(i,j);
        end
    end
    
    if(sumCoef <> 1)
        disp("Erreur : la somme des coef est différente de 1");
        res = %f;
    else
        res = %t;
    end
endfunction


//visualiser le filtre   
function res = showFilter(F, n) 
    plot3d(1:n, 1:n, F); 
endfunction



F = fspecial('gaussian', 3);
gauss_img2 = GaussFilter(img2, 3);
gauss_img3 = GaussFilter(img3, 3);


//Il semble que ce filtre est plus éfficace sur le bruit binaire




