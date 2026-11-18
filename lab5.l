/* 5.	Write a Lex program that accurately groups numeric constants into standard
 signed/unsigned Integers or Floating-Point fractions
lex -o q5lex.c q5.l
gcc q5lex.c -o q5
 ./q5

 lex -o q5lex.c q5.l && gcc q5lex.c -o q5
Enter numbers separated by space (Ctrl+D to exit):
10 -25 45 3.14
Signed/Standard Integer : 10
Signed/Standard Integer : -25
Signed/Standard Integer : 45
Floating-Point Fraction : 3.14
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
