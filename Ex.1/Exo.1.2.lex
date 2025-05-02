%{
    #include <stdio.h>
    #include <string.h>

    char customerName[100];
    int concertCount = 0;

    void yyerror(const char *s);
%}

%%
"Dossier"       { /* Mot-clé Dossier, ignoré car non requis pour le comptage */ }
"places"        { concertCount++; }

[0-9]{8}        { /* Code du dossier, ignoré car non requis ici */ }
T[0-9]{2,6}     { /* Code du concert, ignoré car non requis ici */ }
[1-9][0-9]?     { /* Nombre de places, ignoré car seule la présence de "places" compte */ }

[A-Z-]+\/[A-Z-]+ {
    if (strlen(yytext) < 100) {
        strcpy(customerName, yytext);
    } else {
        yyerror("Nom trop long");
    }
}

[A-Z0-9-]+      { /* Nom du concert, ignoré car non requis ici */ }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { /* Date, ignorée car non requise ici */ }
[0-9]{2}:[0-9]{2}    { /* Heure, ignorée car non requise ici */ }

[ \t]+          { /* Ignorer les espaces et tabulations */ }
\n              { /* Retour chariot, ignoré car non requis ici */ }

.               { fprintf(stderr, "Error: Unexpected character '%s'\n", yytext); }
%%

int yywrap() {
    printf("%s a acheté des places de %d concerts.\n", customerName, concertCount);
    return 1;
}

void yyerror(const char *s) {
  fprintf(stderr, "Erreur de syntaxe : %s\n", s);
}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}
