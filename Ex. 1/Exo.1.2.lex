%{
    #include <stdio.h>
    #include <string.h>

    char customerName[100];
    int concertCount = 0;
%}

%%

"Dossier"       { }
"places"        { concertCount++; }

[0-9]{8}        { }
T[0-9]{2,6}     { }
[1-9][0-9]?     { }

[A-Z-]+\/[A-Z-]+ { strcpy(customerName, yytext); }

[A-Z0-9-]+      { }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { }
[0-9]{2}:[0-9]{2}    { }

[ \t]+          { }
\n              { }

.               { fprintf(stderr, "Error: Unexpected character '%s'\n", yytext); }

%%

int yywrap() {
    printf("%s a acheté des places de %d concerts.\n", customerName, concertCount);
    return 1;
}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}
