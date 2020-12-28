%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "cal.tab.h"
%}

%option noyywrap

%%

[0-9]+(\.[0-9]+)?([eE][0-9]+)?  { yylval.numbers = atof(yytext); return NUM;}
[-+()*/]                        { return yytext[0]; }
[ \t\f\v\n]                     {  }
.                               {}
%%
