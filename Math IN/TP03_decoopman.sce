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



//Calcul du ième polynome de Bernstein
function B = Bernstein(t,n)
    temp = zeros(1,n);
    for i = 1:n
        num = fact(n) * (t(i)^i) * ((1-t(i))^(n-i));
        den = fact(i) * fact(n-i);
        temp(i) = num / den;                        // ième polynome de Bernstein
    end

    B = temp                 
endfunction




P0 = [0, 0, 0];
P1 = [1, 1, 0];
P2 = [2, 1, 0];
P3 = [3, 0, 0];

ptsControle = [P0; P1; P2; P3];

// On trace les n polynomes de Bernstein
function A = trace_Bernstein(n)
    t = linspace(0, 1 , n);         // n valeurs égalemen espacées appartenant à l'intervalle de la courbe
    plot(t, Bernstein(t,n));   //B(i) = Bernstein( t(i), i, n );
    A = B;
endfunction












