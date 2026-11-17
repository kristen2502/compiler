/* 4.	Write a Lex program to check all input characters and 
calculate the total count of vowels versus consonants.
flex -o q4lex.c q4.l
gcc q4lex.c -o q4
./q4
*/

%{
#include <stdio.h>

int vowels = 0, consonants = 0;
%}

%%

[aAeEiIoOuU]    { vowels++; }
[a-zA-Z]        { consonants++; }
.|\n            ;

%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        if (!fp) {
            perror("Error opening file");
            return 1;
        }
        yyin = fp;
    } else {
        printf("Enter text (press Ctrl+D on a new line when finished):\n");
    }

    yylex();
    printf("\nTotal Vowels:     %d\nTotal Consonants: %d\n", vowels, consonants);
    return 0;
}
