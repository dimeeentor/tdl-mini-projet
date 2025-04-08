run1: exo1_1
	./exo1_1 < commandeBillet.txt

exo1: lex.yy.c
	gcc lex.yy.c -o exo1_1 -ll

lex: Exo.1.1.lex
	flex Exo.1.1.lex

clean:
	rm -f exo1_1 lex.yy.c
