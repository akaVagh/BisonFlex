%{
int countCap = 0;
int countSml = 0;
%}

%option noyywrap

%%

[A-Z] {printf("%s capital letter\n", yytext); countCap++;}
[a-z] {printf("%s Small letter\n", yytext); countSml++;}
.     {printf("%s not a letter\n", yytext);}
\n    {return 0;}

%%

int main(){
yylex();
printf("\nNumber of Captial letters in the given input : %d\n", countCap);
printf("\nNumber of Small letters in the given input : %d\n", countSml);
return 0;
}
