/*
8. Write a syntax parser using Yacc that tracks opening and closing brackets, 
verifying whether brackets sequence pairs (e.g., (())()) match perfectly.

Directory & Compilation Commands:
2505260/
├── q8.l
└── q8.y

flex -o q8lex.c q8.l
bison -y -o q8yacc.c q8.y
gcc q8lex.c q8yacc.c -o q8
./q8

  .l file
*/

%{
%}

%%
"("     { return '('; }
")"     { return ')'; }
\n      { return '\n'; }
[ \t]   ; /* Ignore spaces and tabs */
.       { return yytext[0]; } /* Pass any invalid character to trigger syntax error */
%%

int yywrap(void) {
    return 1;
}
