# Search API

## Installer les modules

* Sur Composer
    * search_api
    * search_api_autocomplete (si besoin)
* Sur Drupal
    * Database Search
    * Search API
    * Search API Autocomplete (si besoin)

## Configuration

### Ajouter un serveur

* Name : Serveur de recherche
* Machine name : server_search
* Minimum word length : 3
* Partial matching : Match on parts of a word

### Ajouter un index

* Name : "Ce qui sera indexé" (produits, contenus, médias)
* Sélection des contenus/paquets à indexer
* Pour chaque paquet : choisir "Only those selected" et sélectionner les types de contenus
* Ordre : more recent items first
* Serveur : sélection du serveur de recherche

### Champs

* Pour un champ de recherche unique recherchant dans plusieurs contenus (node, taxonomy_term) :
* Ajouter les champs correspondant et mettre le type à "Full text" en boost 1.0
* Ajouter les champs changed (pour trier la vue)

### Processeurs

Activer les processeurs suivant :

* Accès au contenu (seulement si la recherche est privée)
* Entity status
* HTML filter
* Ignore case
* Tokenizer
* Transliteration
* Ordre/configuration : laisser par défaut et optimiser ensuite si besoin

### Vue

* Créer la vue pour rechercher
* Page ou block
* Mettre les champs à rechercher
* Mettre les champs pour le formulaire exposé
* Mettre l'ordre par relevance DESC + date changed ASC

### Autocompletion

* Cocher tous les suggesters
* Laisser le reste par défaut et optimiser ensuite si besoin