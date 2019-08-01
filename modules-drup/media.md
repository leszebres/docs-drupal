# DrupMedia

Types de médias gérés :

* **Image** : rendu d'une image selon un style d'image \(statique rendant une image, ou dynamique rendant un élément picture avec un style d'image différent selon des breakpoints responsives\)
* **Document** : fichier téléchargeable
* **Vidéo Externe** : vidéo Youtube ou Viméo, agrégée via oEmbed, avec gestion de la maniature

## Depuis drupField

```php
// Récupérer le média d'un champ :
$drupField->getDrupMedia($fieldname, $type[image, document, video_external])

// Rendre en tant qu'URL
if (($mediaField = $drupField->getDrupMedia('banner', 'image')) && ($medias = $mediaField->getMediasUrl('thumbnail'))) {
    $mediaUrl = current($medias);
}

// Rendre en tant que balise img    
if (($mediaField = $drupField->getDrupMedia('banner', 'image')) && ($medias = $mediaField->renderMedias('thumbnail'))) {
    $mediaMarkup = current($medias);
}
```

## Directement

```php
$mediaEntity = new DrupMediaXXX($entity);
```

On peut passer en paramètre un/des Id de médias ou directement une/des entité\(s\) Media.

### Methodes :

Chaque méthode retourne un tableau.

* $mediaEntity-&gt;renderMedias\(...\)
* $mediaEntity-&gt;getMediasUrl\(...\)
* $mediaEntity-&gt;getMediasData\(...\)

Selon le type de Media renseigné, les méthodes ont des rendus différents.

