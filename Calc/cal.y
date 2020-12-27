%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *err);
extern int yylex();
%}

%token <numbers> NUM
%type <numbers> A B C

%union{ float numbers; }

%%
S : A           { printf("Answer is %f\n", $1); }
  ;
A : A '+' B     { $$ = $1 + $3; }
  | A '-' B     { $$ = $1 - $3; }
  | B           { $$ = $1; }
  ;
B : B '*' C     { $$ = $1 * $3; }
  | B '/' C     { $$ = $1 / $3; }
  | C           { $$ = $1; }
  ;
C : NUM         { $$ = $1; }
  | '-' C       { $$ = -$2; }
  | '(' B ')'   { $$ = $2; }
  ;
%%

void yyerror(char *err) {
    fprintf(stderr, "%s\n", err);
    exit(1);
}

int main() {
    yyparse();
    return 0;
}
