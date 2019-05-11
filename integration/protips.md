# Protips génériques

## Variables d'alignement

- $v-align* : uniquement pour de l'alignement vertical (top/bottom)
- $grid-gutter* : uniquement pour de l'alignement horizontal (left/right)

**Concernant l'alignement horizontal, essayer de privilégier des % plutôt que des valeurs en dur quand elles sont importantes.**

## Positionnement vertical

Pour positionner verticalement un élément, selon les contextes :

#### En static :

    display: inline-flex;
    align-item: center;
    
#### En absolute :
    
    position: absolute; 
    top: 50%; // ne pas mettre ici de valeurs en dur en px
    transform: translateY(-50%);


## Limiter la taille d'un block

    // Contexte :
    .container {
        background: #000;
    }
   
    // Bad : en responsive il faudra reset ces valeurs
    .child {
        padding-right: 80px;
        padding-left: 80px;
    }
    
    // Good : déjà optimisé pour le responsive
    .child {
           max-width: 400px;
           margin: 0 auto; 
           padding: 10px 0;
    }
    
    