%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yylex();
    void yyerror(const char *s);
%}

%union {
    int ival;
    char *sval;
}

%token <sval> T_CODE_DOSSIER
%token <ival> T_NB
%token T_DOSSIER T_PLACES T_PRENOM_NOM T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_RC

%type <sval> entete
%type <ival> concert
%type <ival> liste_concerts

%start commande

%%
commande      : entete infos_perso liste_concerts
                {
                  printf("Le dossier %s concerne %d places\n", $1, $3);
                  free($1);
                  YYACCEPT;
                }
              ;

entete        : T_DOSSIER T_CODE_DOSSIER T_RC
                { $$ = $2; }
              ;

infos_perso   : T_PRENOM_NOM T_RC
              ;

liste_concerts: concert
                { $$ = $1; }
              | liste_concerts concert
                { $$ = $1 + $2; }
              ;

concert       : T_CODE_CONCERT T_NOM_CONCERT T_DATE T_HEURE T_NB T_PLACES T_RC
                { $$ = $5; }
              ;

%%

void yyerror(const char *s) {
  fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
  return yyparse();
}
