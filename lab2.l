/*2.	Write a Lex program to verify whether 
a given input string qualifies as a valid C programming 
identifier (starts with a letter/underscore, followed by letters, underscores, or digits). 
 vim q2.l
flex -o q2lex.c q2.l
gcc q2lex.c -o q2
./q2
is this right

*/

%{
#include <stdio.h>
%}

/* Shorthand definitions for readability */
LETTER  [a-zA-Z_]
DIGIT   [0-9]

%%

^(auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)$ {
    printf("'%s' -> Invalid Identifier (C Keyword)\n", yytext);
}

^{LETTER}({LETTER}|{DIGIT})*$ {
    printf("'%s' -> Valid Identifier\n", yytext);
}

^.*$ {
    printf("'%s' -> Invalid Identifier\n", yytext);
}

\n { /* Ignore newline characters between inputs */ }

%%

int main() {
    printf("Enter strings to check (Press Ctrl+D to exit):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
