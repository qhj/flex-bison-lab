%{
#include<stdio.h>
int yylex();
int yyerror(char* s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP

%%
calclist:
  | calclist exp EOL {printf("= %d\n", $2);}
  | EOL // 允许只有注释的行
  ;

exp: factor
  | exp ADD factor { $$ = $1 + $3;}
  | exp SUB factor { $$ = $1 - $3;}
  ;

factor: term
  | factor MUL term { $$ = $1 * $3;}
  | factor DIV term { $$ = $1 / $3;}
  ;

term: NUMBER
  | ABS term ABS { $$ = $2 >= 0 ? $2 : - $2;}
  | OP exp CP {$$=$2;}
  ;
%%

int main(int argc, char **argv)
{
    yyparse();
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}