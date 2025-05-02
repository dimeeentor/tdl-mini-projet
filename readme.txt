Mini-Projet L2 Info 2024-2025 TD3
Binôme : HONCHARENKO Dmytro, ZAGINEI Mykyta

Contenu de l'archive :
- Exo.1.1.lex : Analyse lexicale, affiche les tokens dans l'ordre requis.
- Exo.1.2.lex : Compte le nombre de concerts et affiche le prénom/nom avec le résultat.
- Exo.2.1.lex, Exo.2.1.yacc : Vérifie la validité syntaxique de la commande.
- Exo.2.2.lex, Exo.2.2.yacc : Calcule et affiche le nombre total de places.
- Exo.2.3.lex, Exo.2.3.yacc : Vérifie la validité avec les numéros de sièges.
- ZAGIENI_HONCHARENKO.ExplicationPlaces.txt : Description de l'ajout des numéros de sièges.
- ZAGIENI_HONCHARENKO.exempleCommande.txt : Exemple de commande avec numéros de sièges.

Structure du code :
- Exo.1.1 : Les tokens sont reconnus et affichés comme demandé (dossier, codeDossier, RC, etc.). Les espaces/tabulations sont ignorés.
- Exo.1.2 : Seuls prenomNom et places sont traités pour sauvegarder le nom et compter les concerts. Les autres tokens sont ignorés (actions vides commentées).
- Exo.2.1 : Grammaire simple avec entete, infos_perso, liste_concerts. Affiche "La commande est valide" si correct.
- Exo.2.2 : Ajoute le calcul du nombre total de places via des variables globales (id_dossier, total_place, nb_places).
- Exo.2.3 : Ajoute l'état SEATS pour reconnaître les numéros de sièges et vérifie leur correspondance avec nb.

Utilisation du Makefile :
- Compiler tous les exercices : `make all`
- Compiler un exercice spécifique : `make ex1_1`, `make ex1_2`, `make ex2_1`, `make ex2_2`, `make ex2_3b`
- Exécuter un exercice avec le fichier d'entrée : `make run1_1`, `make run1_2`, `make run2_1`, `make run2_2`, `make run2_3b`
- Nettoyer tous les fichiers générés : `make clean`
- Nettoyer un exercice spécifique : `make clean1_1`, `make clean1_2`, `make clean2_1`, `make clean2_2`, `make clean2_3b`

Point faible identifié :
Nous avons constaté que nos expressions régulières pour les dates ([0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2})?) et les noms ([A-Z-]+\/[A-Z-]+) ne sont pas assez précises. Elles autorisent des entrées invalides comme 99/99 ou --/--. Nous avons tenté d'améliorer ces expressions (par exemple, ([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])(\/[0-9]{2})? pour les dates), mais n'avons pas trouvé de solution pleinement satisfaisante dans le temps imparti. Nous sommes conscients de cette limitation et l'avons documentée pour montrer notre compréhension du problème.
