/*1.Write a Lex program to count the number of characters, words, spaces, and lines in a given input stream or file.
to create : vim q1.l or nano q1.l
vim q1.l
flex -o q1_lex.c q1.l
gcc q1_lex.c -o q1
./q1
*/
%{
#include <stdio.h>

int chars = 0;
int words = 0;
int spaces = 0;
int lines = 0;
%}

%%
\n              { lines++; chars++; }
[ \t]           { spaces++; chars++; }
[^ \t\n]+       { words++; chars += yyleng; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        if (!fp) {
            perror("Error opening file");
            return 1;
        }
        yyin = fp;
    } else {
        printf("Enter text (Press Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Count Results ---\n");
    printf("Characters : %d\n", chars);
    printf("Words      : %d\n", words);
    printf("Spaces     : %d\n", spaces);
    printf("Lines      : %d\n", lines);

    if (argc > 1 && yyin) {
        fclose(yyin);
    }

    return 0;
}



