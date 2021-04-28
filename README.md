# README

Lancer le jeu : `ruby app.rb`

## 1. Introduction
- jeu à 2 joueurs humains
- commencer en demandant le "prénom" de chaque joueur
- jeu est composé de 9 cases :
  - position verticale (A, B ou C)
  - position horizontale (1, 2 ou 3)
  - Exemple : case en haut à droite "A3"
- début de chaque tour de jeu :
  - affiche le plateau de jeu (dans le terminal)
  - demande au joueur dont c'est le tour où il souhaite jouer
- jeu à tour de rôle
- détecter la fin de la partie
  - le jeu annonce le nom gagnant
  - match nul => informer les deux joueurs
- en fin de partie, proposer de lancer une "nouvelle partie"
- effort à faire sur l'affichage du jeu

## 2. Le projet
### Etape 1 : Demander aux 2 joueurs leurs prénoms
- affichage de la question
- récupération du gets.chomp
- sauvegarde dans un objet *Player*
### Etape 2
- afficher un plateau vide
- demander à un joueur ce qu'il veut faire
- en fonction de sa réponse remplir une case
  - sauver l'information dans un objet
  - puis afficher le plateau modifié dans le terminal
  - prendre en compte quelques cas particuliers
    - la saisie du joueur ne correspond pas à une case
    - le joueur choisit une case déjà occupée...
- ...
### Etape 3 : Astuces
- remplacer `puts "-----------"` par `puts "-" * 30`
- `system "clear"` ou `system "cls"` => vident l'écran de ton terminal
## 3. Liste des classes
### Faire tourner le jeu
- `Game`
  - jeu
  - initialise et lance une partie
    - crée 2 instances de *Player*
    - crée 1 instance de *Board*
  - jouer 1 tour
  - si la partie est finie...
  - Variables d'instance :
    - lui rattacher les 2 players (array)
    - lui rattacher le Board
    - lui rattacher des informations annexes comme
       -  "quel joueur doit jouer ?"
       -  "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)"...
    - Méthodes :
      - permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case)
      - s'occupe de finir la partie
      - propose aux joueurs de faire une nouvelle partie
- `Player`
  - les joueurs
  - 2 instances de cette classe
  - un joueur a un nom et un symbole (`x` ou `o`)
- `Board`
  - plateau
  - 1 instance de cette classe
  - à l'initialisation du plateau, instancie immédiatement 9 BoardCase
  - Variables d'instance :
    - le Board doit embarquer les 9 BoardCase
    - lui attribuer zn array ou hash
    - compter le nombre de coup joué pour identifier l'arrivée au 9ème coup sans vainqueur
  - Méthodes :
    - fait le lien entre les BoardCases et le Game
    - il change les valeurs des BoardCases (de `" "` à `x` ou `o`)
    - vérifie en fonction de la combinaison des BoardCases si la partie est finie
      - un joueur a gagné
      - ou 9 cases sont remplies sans vainqueur
- `BoardCase`
  - case
  - 9 instances de cette classe (état d'une case)
  - Variables d'instance : position (A1...) et contenu (vide, X ou O)
### Organiser le programme
- `Application`
  - lancer le jeu
  - va faire une boucle infinie de parties
    - tant que les joueurs veulent continuer
  - lancer l'instanciation d'un Game
- `Show`
  - view
  - affichera l'état du plateau de jeu