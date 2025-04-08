run1.1: exo1_1
	./exo1_1 < commandeBillet.txt

run1.2: exo1_2
	./exo1_2 < commandeBillet.txt

exo1.1: lex.yy.c
	gcc ./Ex. 1/lex.yy.c -o exo1_1 -ll

exo1.2: lex.yy.c
	gcc lex.yy.c -o exo1_2 -ll

lex1.1: Exo.1.1.lex
	flex Exo.1.1.lex

lex1.2: Exo.1.2.lex
	flex Exo.1.2.lex

clean:
	rm -f exo1_1 exo1_2 lex.yy.c
