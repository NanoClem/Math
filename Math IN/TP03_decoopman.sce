// NOTES
//Méthode par avancée de front = algo pour avoir une courbe de Bézier correcte


// EXERCICE 1


// Fonction pour les factorielles
function f = fact(n)
    if (n==0) then
        f = 1;
    else
        f = prod(1:n);
    end
endfunction



P0 = [0, 0, 0];
P1 = [1, 1, 0];
P2 = [2, 1, 0];
P3 = [3, 0, 0];

ptsControle = [P0; P1; P2; P3];

// Utiliser un linspace peut être judicieux
function A = Bernstein(n)
    t = linspace(0, 1 , n);         // Valeurs appartenant à l'intervalle de la courbe
    B = zeros(1,n);
    for i = 1:n
       B(i) = (fact(n) * (t(i)^i) * ((1-t(i) )^(n-i)) ) / fact(i) * fact(n-i);   // ième polynome de Bernstein
    end
    //plot(t, B);
    A = B;
endfunction


function TraceBernstein(t, B)
    plot(t, B);
endfunction

tB = Bernstein(10);

