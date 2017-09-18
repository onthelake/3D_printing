$fn = 15;

_a = ["a", 1, 0, 0, 0, 0, 0];
_b = ["b", 1, 0, 1, 0, 0, 0];
_c = ["c", 1, 1, 0, 0, 0, 0];
_d = ["d", 1, 1, 0, 1, 0, 0];
_e = ["e", 1, 0, 0, 1, 0, 0];
_f = ["f", 1, 1, 0, 1, 0, 0];
_g = ["g", 1, 1, 1, 1, 0, 0];
_h = ["h", 1, 0, 1, 1, 0, 0];
_i = ["i", 0, 1, 1, 0, 0, 0];
_j = ["j", 0, 1, 1, 1, 0, 0];

_k = ["k", 1, 0, 0, 0, 1, 0];
_l = ["l", 1, 0, 1, 0, 1, 0];
_m = ["m", 1, 1, 0, 0, 1, 0];
_n = ["n", 1, 1, 0, 1, 1, 0];
_o = ["o", 1, 0, 0, 1, 1, 0];
_p = ["p", 1, 1, 1, 0, 1, 0];
_q = ["q", 1, 1, 1, 1, 1, 0];
_r = ["r", 1, 0, 1, 1, 1, 0];
_s = ["s", 0, 1, 1, 0, 1, 0];
_t = ["t", 0, 1, 1, 1, 1, 0];

_u = ["u", 1, 0, 0, 0, 1, 1];
_v = ["v", 1, 0, 1, 0, 1, 1];
_w = ["w", 0, 1, 1, 1, 1, 1];
_x = ["x", 1, 1, 0, 0, 1, 1];
_y = ["y", 1, 1, 0, 1, 1, 1];
_z = ["z", 1, 0, 0, 1, 1, 1];

_Maj = ["Maj", 0, 1, 0, 0, 0, 1];

longueurBrique = 10;
largeurBrique = 6;


module picots(info, typePoint, rayon) {
    posX = [2, 2, 4, 4, 6, 6];
    posY = [2.5, 4.5, 2.5, 4.5, 2.5, 4.5];

    for ( i = [0:5] ) {
        if (info[i+1] == typePoint) 
            translate([posX[i], posY[i], 0]) 
                sphere(rayon);
    }
}

module lettreBraille(info) {
    epaisseur = 2;
    rayonPoint = 1;

    difference() {        
        union() {
            cube([longueurBrique, largeurBrique, epaisseur]);
            translate([0, 0, epaisseur - rayonPoint / 2])
                picots(info, 1, rayonPoint);
        }
        
        
        translate([0, 0, epaisseur]) 
            picots(info, 0, rayonPoint / 2);
    }
}



mot = [_Maj, _b, _o, _n, _j, _o, _u, _r];

echo("Il y a ", len(mot)," lettres.");

intervalleEntreLettres = largeurBrique + 0;
for (num = [0 : len(mot) - 1]) {
    lettre = mot[num];
    echo(lettre);
    translate([0, intervalleEntreLettres * num, 0]) 
        lettreBraille(lettre);
}