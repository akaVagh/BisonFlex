%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%option noyywrap

%%

[0-9]+ { printf("%s\n",yytext);}
.|\n { }
%%
int main(){
yylex();
return 0;
}
