/* 5.	Write a Lex program that accurately groups numeric constants into standard
signed/unsigned Integers or Floating-Point fractions
*/

%{
#include <stdio.h>
%}

DIGIT   [0-9]
SIGN    [+-]

%%

\+?{DIGIT}+[uU]                                         { printf("Unsigned Integer        : %s\n", yytext); }
{SIGN}?{DIGIT}+                                         { printf("Signed/Standard Integer : %s\n", yytext); }
{SIGN}?{DIGIT}*"."{DIGIT}+([eE]{SIGN}?{DIGIT}+)?[fF]?   { printf("Floating-Point Fraction : %s\n", yytext); }
{SIGN}?{DIGIT}+"."{DIGIT}*([eE]{SIGN}?{DIGIT}+)?[fF]?   { printf("Floating-Point Fraction : %s\n", yytext); }
{SIGN}?{DIGIT}+[eE]{SIGN}?{DIGIT}+[fF]?                 { printf("Floating-Point Fraction : %s\n", yytext); }
[ \t\n]+                                                ;
.                                                       { printf("Unrecognized token      : %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    printf("Enter numbers separated by space (Ctrl+D to exit):\n");
    yylex();
    return 0;
}
