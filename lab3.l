/* 3.	Write a Lex program to detect and count (or strip out) single-line (//) and multi-line (/* ... *  /) 
comments from a C file code snippet.

vim q3.l
flex -o q3_lex.c q3.l
gcc q3_lex.c -o q3
./q3
   
*/
%{
#include <stdio.h>
int single_comments = 0;
int multi_comments = 0;
%}
%x MULTI
%%
"//".* { single_comments++; }
"/*" { BEGIN(MULTI); }
<MULTI>"*/" { multi_comments++; BEGIN(INITIAL); }
<MULTI>\n ;
<MULTI>. ;
. { putchar(yytext[0]); }
\n { putchar('\n'); }
%%
int yywrap() { return 1; }
int main(int argc, char **argv) { if (argc > 1) {
 FILE *f = fopen(argv[1], "r");
 if (!f) { perror("File opening failed"); return 1; }
 yyin = f;
 }
 yylex();
 fprintf(stderr, "\n--- Comment Summary ---\n");
 fprintf(stderr, "Single-line comments: %d\n", single_comments);
 fprintf(stderr, "Multi-line comments: %d\n", multi_comments);
 return 0;
}
