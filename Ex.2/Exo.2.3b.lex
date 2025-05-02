%{
    #include <stdio.h>
    #include "y.tab.h"

    extern int global_nb;
%}

%x SEATS

%%
"Dossier"       { return T_DOSSIER; }
"places"        { return T_PLACES; }

[0-9]{8}        { return T_CODE_DOSSIER; /* Code du dossier : 8 chiffres */ }
T[0-9]{2,6}     { return T_CODE_CONCERT; /* Code du concert : T suivi de 2 à 6 chiffres */ }
[1-9][0-9]?     { global_nb = atoi(yytext); return T_NB; /* Nombre de places : sauvegarder */ }

[A-Z-]+\/[A-Z-]+ { return T_PRENOM_NOM; }
[A-Z0-9-]+       { return T_NOM_CONCERT; }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { return T_DATE; /* Date : format DD/MM ou DD/MM/YY */ }
[0-9]{2}:[0-9]{2}                   { return T_HEURE; /* Heure : format HH:MM */ }

"["             { BEGIN(SEATS); return T_LBRACKET; /* Début de la liste des sièges */ }
<SEATS>[0-9]+   { return T_SEAT_NUMBER; /* Numéro de siège : entier non signé */ }
<SEATS>"]"      { BEGIN(INITIAL); return T_RBRACKET; /* Fin de la liste des sièges */ }
<SEATS>[ \t]+   { /* Ignorer les espaces dans la liste des sièges */ }

[ \t]+          { /* Ignorer les espaces et tabulations */ }
\n              { return T_RC; }

.               { fprintf(stderr, "Erreur lexicale : Caractère inattendu '%s'\n", yytext); }
%%

int yywrap() {
    return 1; /* Fin du fichier */
}
