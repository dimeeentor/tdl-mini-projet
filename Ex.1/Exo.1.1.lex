%{
    #include <stdio.h>
%}

%%
"Dossier"       { printf("dossier "); }
"places"        { printf("places "); }

[0-9]{8}        { printf("codeDossier "); }
T[0-9]{2,6}     { printf("codeConcert "); }
[1-9][0-9]?     { printf("nb "); }

[A-Z-]+\/[A-Z-]+ { printf("prenomNom "); }

[A-Z0-9-]+      { printf("nomConcert "); }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { printf("date "); }
[0-9]{2}:[0-9]{2}    { printf("heure "); }

[ \t]+          { }
\n              { printf("RC\n"); }

.               { fprintf(stderr, "Error: Unexpected character '%s'\n", yytext); }
%%


int yywrap() {
    printf("FinFichier\n");
    return 1;
}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}
