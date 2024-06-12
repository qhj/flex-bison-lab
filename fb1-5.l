%{
#include "fb1-5.tab.h"
%}

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
-?[0-9]+ {yylval = atoi(yytext);return NUMBER;}
-?0x[a-f0-9]+ {char *endptr;yylval = strtol(yytext, &endptr, 16); return NUMBER;}
\n {return EOL;}
[ \t]
"(" {return OP;}
")" {return CP;}
"//".*
. {printf("Mystery character %c\n", *yytext);}
%%