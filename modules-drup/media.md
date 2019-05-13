# DrupMedia

## Depuis drupField

```text
// Récupérer le média d'un champ :
$drupField->getDrupMedia($fieldname[, $type=image])

// Rendre en tant qu'URL
if (($mediaField = $drupField->getDrupMedia('banner')) && ($medias = $mediaField->getMediasUrl('thumbnail'))) {
    $mediaUrl = current($medias);
}

// Rendre en tant que balise img    
if (($mediaField = $drupField->getDrupMedia('banner')) && ($medias = $mediaField->renderMedias('thumbnail'))) {
    $mediaMarkup = current($medias);
}
```

## Directement

```text
$mediaEntity = new DrupMediaImage([$mediaEntity]);
// ou
$mediaEntity = new DrupMediaImage([5]); // MediaId

if ($medias = $mediaEntity->renderMedias($result->imageStyle)) {
    $mediaMarkup = current($medias);
}
```

