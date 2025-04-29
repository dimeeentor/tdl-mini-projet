%{
    #include <stdio.h>
    #include "y.tab.h"

    extern int global_nb;
%}

%x SEATS

%%

"Dossier"       { return T_DOSSIER; }
"places"        { return T_PLACES; }

[0-9]{8}        { return T_CODE_DOSSIER; }
T[0-9]{2,6}     { return T_CODE_CONCERT; }
[1-9][0-9]?     { global_nb = atoi(yytext); return T_NB; }

[A-Z-]+\/[A-Z-]+ { return T_PRENOM_NOM; }
[A-Z0-9-]+      { return T_NOM_CONCERT; }

[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})? { return T_DATE; }
[0-9]{2}:[0-9]{2}    { return T_HEURE; }

"["             { BEGIN(SEATS); return T_LBRACKET; }
<SEATS>[0-9]+   { return T_SEAT_NUMBER; }
<SEATS>"]"      { BEGIN(INITIAL); return T_RBRACKET; }
<SEATS>[ \t]+   { }

[ \t]+          { }
\n              { return T_RC; }

.               { fprintf(stderr, "Lexer error: Unexpected character '%s'\n", yytext); }
%%

int yywrap() {
    return 1;
}
