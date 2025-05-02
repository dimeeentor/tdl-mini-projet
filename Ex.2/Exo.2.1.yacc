%{
    #include <stdio.h>
    #include <stdlib.h>

    extern int yylex();
    void yyerror(const char *s);
%}

%token T_DOSSIER T_PLACES
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

concert : T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB T_PLACES T_RC /* Concert : informations complètes */;
%%

void yyerror(const char *s) {
  fprintf(stderr, "Erreur de syntaxe : %s\n", s);
}

int main() {
    if (yyparse() != 0) {
        exit(1); // Fin en cas d'erreur d'analyse
    }

    return 0;
}
