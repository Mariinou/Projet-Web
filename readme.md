#Note-ilus

## Prérequis

Avoir installé :
- ruby 2.3.0 ou supérieur 
- postgresql

## Installation

```bash
git clone https://github.com/Mariinou/Projet-Web
bundle install
rake db:create
rake db:setup
rails s
```

## Utilisation 

4 utilisateurs sont créés dans les seed oar défaut:
 - 1 administrateur, email: admin@force.fr, mot de passe: thebest
 - 1 enseignant, email: prof@lycee.com, mot de passe: prof31
 - 1 étudiant, email: patate@gpol.fr, mot de passe: Patate12
 - 1 étudiant, email:  toto@gpol.fr, mot de passe: Toto12

2 matières sont créées par défaut:
 - Mathématiques
 - Français

L'étudiant Paul Jacques est inscrit en Mathématiques et Français
L'étudiant Pierre Toto est inscrit en Mathématiques

Vous pouvez vous connecter avec ces utilisateurs et découvrir les fonctionnalités pour chacun d'eux.

Vous pouvez créer un nouvel enseignant depuis le lien s'inscrire sur la page d'acceuil, puis il faudra se connecter avec l'administrateur pour valider cet enseignant.

Un enseignant peut créer, après s'être connecté, un nouvel étudiant depuis la page dédiée. 
Cet étudiant est validé par l'enseignant lors de l'inscription et reçoit un mail avec un mot de passe généré pour l'informer de l'inscription.

Afin de tester l'ajout des notes, il est nécessaire de créer une épreuve, ce qui se fait depuis la page d'acceuil après connexion avec l'enseignant.

Vous pouvez également tester l'envoi d'email en créant un compte avec votre adresse mail et en cliquant sur mot de passe oublié, ou alors en créant un étudiant qui aura votre adresse mail.

Même si l'étudiant essaie d'accéder à certaines pages (comme l'ajout de note), car il connait l'URL, l'accès lui sera refusé.
