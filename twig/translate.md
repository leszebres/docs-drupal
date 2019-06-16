# Traduction

## Avec contexte :

```twig
{{ 'January'|t({}, {'context': 'Long month name'}) }}
```

## Avec remplacements

```twig
{{ "Submitted by !author on @date"|t({ '!author': author, '@date': date }) }}
```

## Placeholders

```text
@key : chaine échappée
:key : utilisés pour les urls seulement
%key : idem que @key mais avec un wrapper html "<em class="placeholder"></em>"
!key et tout le reste : aucun traitement
```

