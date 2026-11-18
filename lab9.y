/*
9. Write a validation system in Yacc to check if a regular infix expressions 
mathematical notation is correctly formulated (e.g., a + b * c is valid, 
but a ++ b is rejected).

flex -o q9lex.c q9.l
bison -y -d -o q9yacc.c q9.y
gcc q9lex.c q9yacc.c -o q9
./q9
*/

%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID NUM

// Operator precedence (lowest to highest)
%left '+' '-'
%left '*' '/'
%right UMINUS      // Higher precedence for unary minus (e.g., -a)

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'          // Ignores blank Enter presses
    | expr '\n'     { printf("Valid: Correctly formulated infix expression.\n"); }
    | error '\n'    { yyerrok; } // Resets parser state on newline so you can test again
    ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '-' expr %prec UMINUS   // Allows negative numbers/variables like -a or -(a + b)
    | '(' expr ')'
    | ID
    | NUM
    ;

%%

void yyerror(const char *s) {
    printf("Invalid: Improper infix mathematical expression.\n");
}

int main(void) {
    printf("Enter infix mathematical expressions (Ctrl+C to exit):\n");
    yyparse();
    return 0;
}
