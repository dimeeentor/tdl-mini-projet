%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yylex();
    void yyerror(const char *s);

    int id_dossier = 0;
    int total_place = 0;
    int nb_places = 0;
%}

%token T_DOSSIER T_PLACES
%token T_CODE_DOSSIER T_PRENOM_NOM T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB
%token T_RC

%%
commande: entete infos_perso liste_concerts {
            printf("Le dossier %d concerne %d places\n", id_dossier, total_place);
            YYACCEPT;
        }
    ;

entete: T_DOSSIER T_CODE_DOSSIER T_RC;

infos_perso: T_PRENOM_NOM T_RC;

liste_concerts: concert | liste_concerts concert;

concert: T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB T_PLACES T_RC { total_place += nb_places; };
%%

void yyerror(const char *s) {
  fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
  return yyparse();
}
