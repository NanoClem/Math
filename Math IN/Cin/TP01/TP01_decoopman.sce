// DECOOPMAN CLEMENT TP01

//M = imread('D:\Git\Math\Math IN\Cin\lena.pgm');
//imshow(M);


function res = degrade(h, l)
    for i = 1:h
        for j = 1:256*l
            res(i,j) = floor( (j-1)/l );
        end
    end
endfunction


Mire = uint8(degrade(60, 2));
//imshow(Mire);




//EXERCICES

I1 = imread('D:\Git\Math\Math IN\Cin\test-couleurs.png');
R  = I1(:, :, 1);
G  = I1(:, :, 2);
B  = I1(:, :, 3);
//imshow(R);
//imshow(G);
//imshow(B);

// Ces trois matrices correspondent respectivement aux pixels rouge, vert et bleu de l'image chargée




//EXERCICE 1

function res = damier(m, n)
    for i = 1:n
        for j = 1:m
            if( pmodulo(j, 2) == 0 )
                if( pmodulo(i, 2) == 0 )
                    res(i,j,1) = 255;
                    res(i,j,2) = 0;
                    res(i,j,3) = 0;
                else
                    res(i,j,1) = 0;
                    res(i,j,2) = 255;
                    res(i,j,3) = 0;
                end
            else
                if( pmodulo(i,2) == 0 )
                    res(i,j,1) = 0;
                    res(i,j,2) = 255;
                    res(i,j,3) = 0;
                else
                    res(i,j,1) = 255;
                    res(i,j,2) = 0;
                    res(i,j,3) = 0;
                end
            end
        end
    end
endfunction


R = damier(100,100);
//imshow(R);






//EXERCICE 2

I1 = imread('D:\Git\Math\Math IN\Cin\test-couleurs.png');

function Mnb = rvb2nb(img)
    img = double(img);
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);
    
    Gr = 0.2126*R + 0.7152*G + 0.0722*B;
    imshow( uint8(Gr) );

    Mnb = Gr;
endfunction







//EXERCICE 3

dollar = imread('D:\Git\Math\Math IN\Cin\dollar.pgm');


function res = verticale(img)
    [m,n] = size(img);
    j = 0;
    for i = 1:n
        cp_img(:,i) = img(:, n-j);
        j = j+1;
    end
    res = cp_img;
endfunction



function res =  horizontale(img)
    [m,n] = size(img);
    j = 0;
    for i = 1:m
        cp_img(i,:) = img(m-j,:);
        j = j+1;
    end
    cp_img = verticale(cp_img);
    res = cp_img;
endfunction


img_test = horizontale(dollar);
//imshow(img_test);









