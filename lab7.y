/*
7.	Design a context-free grammar validation script using both Lex and Yacc that 
verifies if a string contains matching quantities of character repetitions ordered cleanly as \(a^{n}b^{n}\) where \(n \ge 0\).
2505260/create yacc fikle
├── q7.l
└── q7.y
yacc file
*/


%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%%
stmt: S '\n' { printf("Valid string for a^n b^n (n >= 0)\n"); exit(0); }
    ;

S   : 'a' S 'b'
    | /* empty string allows n = 0 */
    ;
%%

void yyerror(const char *s) {
    printf("Invalid string: does not match a^n b^n\n");
    exit(0);
}

int main(void) {
    printf("Enter string to test: ");
    yyparse();
    return 0;
}
