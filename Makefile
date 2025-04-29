# Compiler and tools
CC = gcc
FLEX = flex
YACC = /opt/homebrew/Cellar/bison/3.8.2/bin/yacc
LEX_FLAGS =
YACC_FLAGS = -d
CFLAGS = -ll

# For exercises that need yacc, we also need -ly flag
YACC_CFLAGS = $(CFLAGS) -ly

# Executables
EX1_1 = ex1_1
EX1_2 = ex1_2
EX2_1 = ex2_1
EX2_2 = ex2_2
EX2_3B = ex2_3b

# Source files
LEX1_1 = ./Ex.1/Exo.1.1.lex
LEX1_2 = ./Ex.1/Exo.1.2.lex
LEX2_1 = ./Ex.2/Exo.2.1.lex
YACC2_1 = ./Ex.2/Exo.2.1.yacc
LEX2_2 = ./Ex.2/Exo.2.2.lex
YACC2_2 = ./Ex.2/Exo.2.2.yacc
LEX2_3B = ./Ex.2/Exo.2.3b.lex
YACC2_3B = ./Ex.2/Exo.2.3b.yacc

# Default target
all: $(EX1_1) $(EX1_2) $(EX2_1) $(EX2_2) $(EX2_3B)

# Rules for Lex-only exercises (1.1 and 1.2)
$(EX1_1): $(LEX1_1)
	$(FLEX) $(LEX_FLAGS) $(LEX1_1)
	$(CC) lex.yy.c -o $(EX1_1) $(CFLAGS)
	rm -f lex.yy.c

$(EX1_2): $(LEX1_2)
	$(FLEX) $(LEX_FLAGS) $(LEX1_2)
	$(CC) lex.yy.c -o $(EX1_2) $(CFLAGS)
	rm -f lex.yy.c

# Rules for Lex+Yacc exercises (2.1, 2.2, and 2.3b)
$(EX2_1): $(YACC2_1) $(LEX2_1)
	$(YACC) $(YACC_FLAGS) $(YACC2_1)
	$(FLEX) $(LEX_FLAGS) $(LEX2_1)
	$(CC) lex.yy.c y.tab.c -o $(EX2_1) $(YACC_CFLAGS)
	rm -f lex.yy.c y.tab.c y.tab.h

$(EX2_2): $(YACC2_2) $(LEX2_2)
	$(YACC) $(YACC_FLAGS) $(YACC2_2)
	$(FLEX) $(LEX_FLAGS) $(LEX2_2)
	$(CC) lex.yy.c y.tab.c -o $(EX2_2) $(YACC_CFLAGS)
	rm -f lex.yy.c y.tab.c y.tab.h

$(EX2_3B): $(YACC2_3B) $(LEX2_3B)
	$(YACC) $(YACC_FLAGS) $(YACC2_3B)
	$(FLEX) $(LEX_FLAGS) $(LEX2_3B)
	$(CC) lex.yy.c y.tab.c -o $(EX2_3B) $(YACC_CFLAGS)
	rm -f lex.yy.c y.tab.c y.tab.h

# Run targets for each exercise
run1_1: $(EX1_1)
	./$(EX1_1) < ./commandeBillet.txt

run1_2: $(EX1_2)
	./$(EX1_2) < ./commandeBillet.txt

run2_1: $(EX2_1)
	./$(EX2_1) < ./commandeBillet.txt

run2_2: $(EX2_2)
	./$(EX2_2) < ./commandeBillet.txt

run2_3b: $(EX2_3B)
	./$(EX2_3B) < ./Ex.2/ZAGIENI_HONCHARENKO.exempleCommande.txt

# Clean everything
clean:
	rm -f $(EX1_1) $(EX1_2) $(EX2_1) $(EX2_2) $(EX2_3B)
	rm -f lex.yy.c y.tab.c y.tab.h

# Individual clean targets
clean1_1:
	rm -f $(EX1_1) lex.yy.c

clean1_2:
	rm -f $(EX1_2) lex.yy.c

clean2_1:
	rm -f $(EX2_1) lex.yy.c y.tab.c y.tab.h

clean2_2:
	rm -f $(EX2_2) lex.yy.c y.tab.c y.tab.h

clean2_3b:
	rm -f $(EX2_3B) lex.yy.c y.tab.c y.tab.h

.PHONY: all clean clean1_1 clean1_2 clean2_1 clean2_2 clean2_3b run1_1 run1_2 run2_1 run2_2 run2_3b
