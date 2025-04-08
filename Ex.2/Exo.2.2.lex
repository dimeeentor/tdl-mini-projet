%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}

%%

"Dossier"       { return T_DOSSIER; }
"places"        { return T_PLACES; }

[0-9]{8}        { yylval.sval = strdup(yytext); return T_CODE_DOSSIER; }
T[0-9]{2,6}     { return T_CODE_CONCERT; }
[1-9][0-9]?     { yylval.ival = atoi(yytext); return T_NB; }

[A-Z-]+\/[A-Z-]+ { return T_PRENOM_NOM; }

[A-Z0-9-]+      { return T_NOM_CONCERT; }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { return T_DATE; }
[0-9]{2}:[0-9]{2}    { return T_HEURE; }

[ \t]+          { }
\n              { return T_RC; }

.               { fprintf(stderr, "Lexer error: Unexpected character '%s'\n", yytext); }

%%

int yywrap() {
    return 1;
}
