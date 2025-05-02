%{
    #include <stdio.h>
    #include <stdlib.h>

    extern int yylex();
    void yyerror(const char *s);

    int global_nb = 0;
    int seat_count = 0;
%}

%token T_DOSSIER T_PLACES T_LBRACKET T_RBRACKET T_SEAT_NUMBER
%token T_CODE_DOSSIER T_PRENOM_NOM T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB
%token T_RC

%start commande

%%
commande : entete infos_perso liste_concerts {
    printf("La commande est valide\n");
    YYACCEPT;
};

entete : T_DOSSIER T_CODE_DOSSIER T_RC /* Dossier et code */;

infos_perso : T_PRENOM_NOM T_RC /* Prénom/nom */;

liste_concerts : concert | liste_concerts concert /* Liste de concerts : un ou plusieurs */;

concert : T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB T_PLACES T_LBRACKET list_seats T_RBRACKET T_RC {
    if (global_nb != seat_count) {
        yyerror("Le nombre de sièges ne correspond pas au nombre de places indiqué");
    }
    seat_count = 0; /* Réinitialiser le compteur */
};

list_seats : T_SEAT_NUMBER { seat_count = 1; }
           | list_seats T_SEAT_NUMBER { seat_count++; };
%%

void yyerror(const char *s) {
    fprintf(stderr, "Erreur syntaxique : %s\n", s);
}

int main() {
    if (yyparse() != 0) {
        exit(1);
    }

    return 0;
}
