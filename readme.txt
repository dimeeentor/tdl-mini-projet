Compile: Ex. 1.1

flex Exo.1.1.lex
gcc lex.yy.c -o exo1_1 -ll
./exo1_1 < commandeBillet.txt

––––––––––––––––––––––––––––––

Compile: Ex. 1.2

flex Exo.1.2.lex
gcc lex.yy.c -o exo1_2 -ll
./exo1_2 < commandeBillet.txt

––––––––––––––––––––––––––––––

Compile: 2.1

/opt/homebrew/Cellar/bison/3.8.2/bin/yacc -d Exo.2.1.yacc
flex Exo.2.1.lex
gcc y.tab.c lex.yy.c -o exo2_1 -ll
./exo2_1 < commandeBillet.txt

––––––––––––––––––––––––––––––

Compile: 2.2

/opt/homebrew/Cellar/bison/3.8.2/bin/yacc -d Exo.2.2.yacc
flex Exo.2.2.lex
gcc y.tab.c lex.yy.c -o exo2_2 -ll
./exo2_2 < commandeBillet.txt
