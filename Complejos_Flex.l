%{
#include <stdio.h>
FILE *yyin;
%}

/* Definiciones */

DIGITO      [0-9]
SIGNO       [+-]
ENTERO      {DIGITO}+
DECIMAL     ({DIGITO}+"."{DIGITO}+)
REAL        ({ENTERO}|{DECIMAL})
EXP         ([eE]{SIGNO}?{DIGITO}+)
NUM         {SIGNO}?{REAL}{EXP}?
IMAG        [iIjJ]

%%

[ \t]*{SIGNO}?{IMAG}[ \t]*\n          { printf("ACEPTA\n"); }
[ \t]*{NUM}[ \t]*[+-][ \t]*{IMAG}[ \t]*\n     { printf("ACEPTA\n"); }
[ \t]*{NUM}[ \t]*[+-][ \t]*{NUM}{IMAG}[ \t]*\n { printf("ACEPTA\n"); }
.*\n                                   { printf("NO ACEPTA\n"); }

%%

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error al abrir archivo\n");
        return 1;
    }

    yylex();
    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}

