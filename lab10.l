/*
10. Write a Yacc grammar to recognize sentences matching the pattern a^n b^m c^n d^m (n >= 1, m >= 1).

flex -o q10lex.c q10.l
bison -y -o q10yacc.c q10.y
gcc q10lex.c q10yacc.c -o q10
./q10
*/

%{
/* No header file needed because we return raw ASCII characters */
%}

%%
a       { return 'a'; }
b       { return 'b'; }
c       { return 'c'; }
d       { return 'd'; }
\n      { return '\n'; }
[ \t]   ;               /* Ignore spaces and tabs */
.       { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}
