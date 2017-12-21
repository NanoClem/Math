// NOTES
//Méthode par avancée de front = algo pour avoir une courbe de Bézier correcte


// EXERCICE 1


//Fonction pour les factorielles
function f = fact(n)
    if (n==0) then
        f = 1;
    else
        f = prod(1:n);
    end
endfunction



//Calcul du n+1 ième polynome de Bernstein
//Arguments : un vecteur t 
function B = Bernstein(t,n)
    result = 0;
    for i = 1:n
        num = fact(n) * (t^i) * ((1-t)^(n-i));
        den = fact(i) * fact(n-i);
        result = num / den;                        // on écrase la valeur de result jusqu'à avoir
    end                                            // le n+1 ième polynome voulu
    B = result
endfunction


//Fonctions définissant les 4 premiers polynômes de Bernstein
deff('[y0] = f0(t)','y0 = (1-t)^3');
deff('[y1] = f1(t)','y1 = 3*t*(1-t)^2');
deff('[y2] = f2(t)','y2 =3*t^2*(1-t)');
deff('[y3] = f3(t)','y3 = t^3');


//Vecteur t de valeurs comprises entre 0 et 1 avec un pas de 0.01 pour adoucir la courbe
t = [0:0.01:1];

function T = trace_Bernstein(t)
    plot(t, f0);
    plot(t, f1);
    plot(t, f2);
    plot(t, f3);
    
    T = %t;
endfunction




//Définition des 4 points de contrôle
P0 = [0, 0, 0];
P1 = [1, 1, 0];
P2 = [2, 1, 0];
P3 = [3, 0, 0];

//Matrice des points de contrôle
ptsControle = [P0; P1; P2; P3];


//Fonction des critères d'arrêt
function F = stopCriterion(C_pts, nbPts)
    if nbPts < 2 then                           //Si il y a moins de 3 points de contrôles
        F = %f                                  //On renvoie faux
    end
    
    for i=1:nbPts-1                             //On parcours les lignes de la matrice des points de contrôle 
        if pts_C(i,:) == pts_C(i+1,:) then      //Si les points de contrôle sont confondus
            F = %f;                             //on renvoie faux et on sort de la boucle
            break;
        end
    end
    F = %t;                                     //on arrive ici si les points sont dissociés
endfunction



//Algorithme de Casteljau
//Fonctionne pour n points de contrôle
function ptCasteljau = Casteljau(t, pts_C)
    
    nbPts = size(pts_C, "r");                         //nb lignes de la matrice des pts controle, soit nb pts de controle
    if stopCriterion(pts_C, nbPts) == %f then
        ptCasteljau = %f;                             //On arrête la fonction selon les critères d'arrêts
    end
    
    ptsContX = pts_C(:,1);  //abscisses des points de controle
    ptsContY = pts_C(:,2);  //ordonnées des points de controle
    xn = 0;                 //paramètres de 
    yn = 0;                 //la courbe de Bézier
    for i = 1:nbPts
        xn = xn + Bernstein(t, i)*ptsContX(i);
        yn = yn + Bernstein(t, i)*ptsContY(i); 
    end
    
    ptCasteljau = [xn, yn, 0];
endfunction



//Fonction qui calcule les points sur la courbe de Bézier
function ptCourbe = calcCourbeBezier(n, pts_C)
    temp = zeros(n,3);
    for t = linspace(0,1,n)                   //n valeurs ente 0 et 1 donc on a un pas de 1/n
        temp = [temp; Casteljau(t, pts_C)];
    end
    ptCourbe = temp;
endfunction




//Fonction de traçage des points de contrôle
function L = trace_controle(t, pts_C)
    ptsContX   = pts_C(:,1);                 //Polynomes 
    ptsContY   = pts_C(:,2);                 //de controle
    
    s            = size(pts_C, "r");         // nombre de lignes de la maatrice des pts controle 
    ptsInterA    = pts_C([1:s-2],:);         // extraction des n-2 points de controle
    ptsInterB    = pts_C([1:s-1],:);         // extraction des n-1 points de controle
    
    OMA          = Casteljau(t, ptsInterA);  //Polynomes de
    OMB          = Casteljau(t, ptsInterB);  //controle intermédiaires
    
    ptContInter  = [OMA; OMB];
    ptContInterX = ptContInter(:,1);
    ptContInterY = ptContInter(:,2);
     
    plot(ptsContX, ptsContY, "--ok");        //tracé des points de contrôle
    plot(ptContInterX, ptContInterY, "-xb")  //tracé des points de contrôle inttermédiaire 
    
    L = %t;  
endfunction



//points avec 10 valeurs de t entre 0 et 1
ptsBezier = calcCourbeBezier(10, ptsControle); 

//Fonction de traçace de courbe de Bézier     
function courbeBezier = trace_Bezier(ptsCourbe)
    ptsBezierX = ptsCourbe(:,1);
    ptsBezierY = ptsCourbe(:,2);
    
    plot(ptsBezierX, ptsBezierY);
    courbeBezier = %t;
endfunction








