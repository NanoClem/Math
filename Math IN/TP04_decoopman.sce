// TP04 DECOOPMAN


P0   = [1, 3];
P1   = [-1, 3];
P2   = [2, -1];
Pts  = [P0; P1; P2];

//Fonction qui test l'inversibilité d'une matrice
//renvoie faux si la matrice n'est pas inversible, vrai sinon
function revert = isReversible(X)
    row = size(X, "r");                        //nombre de lignes
    col = size(X, "c");                        //nombre de colonnes
    
    if(row ~= col | det(X) == 0) then          // si la matrice n'est pas carrée ou si le déterminant est nul
        revert = %f;                           // la marice n'est pas inversible
    else
        revert = %t;
    end
endfunction




function X = getMatX(Pi)
    pX  = Pi(:,1);    
    X   = [ pX(1)**2, pX(1), 1;              // Matrice X
            pX(2)**2, pX(2), 1;
            pX(3)**2, pX(3), 1 ];
endfunction



function Y = getMatY(Pi)
    pY = Pi(:,2);
    Y = pY';
endfunction




//Fonction pour calculer l'interpolation d'un polynome
//retourne les coefficients du polynome permettant d'interpoler les points pasés en paramètre
//comme on a 3 points passés en paramètre (dans la matrice Pi), il s'agira d'un polynome de dégré 2
function interpol = poly_interpol(Pi)
    
    X   = getMatX(Pi);                       // matrice X
          
    if( isReversible(X) == %f ) then         // On teste la matrice X pour savoir si elle est inversible
        interpol = %f;                       // si X n'est pas inversible, on arrête la fonction et on renvoie faux
    end
    
    revX = inv(X);                          // matrice 
    Y    = getMatY(Pi)                      // matrice ou vecteur Y
    
    C    = Y * revX;                        // matrice des coefficients du polynome
    
    interpol = C;
endfunction



coef = poly_interpol(Pts);

function courbeInter = trace_interpol(C, Pi)
    XPi   = Pi(:,1);            //Absisse des points, attention renvoie un vecteur colonne
    YPi   = Pi(:,2);            //Ordonnée des points, attention renvoie un vecteur colonne
    X     = getMatX(Pi);
    Y     = getMatY(Pi);
    Poly  = poly(C, "x", "c");  //Polynome de coef c (valeurs de C), avec la variable x
    xdata = [-2:.1:3];
    
    plot(XPi', YPi');           //tracé de la droite passant par ces 3 points
    plot(X, Y', "+r", xdata, horner(Poly, xdata), "b");
    
    disp(XPi');
    disp(YPi');
    disp(C, "les coefs du polynome");
    courbeInter = %t;
endfunction









