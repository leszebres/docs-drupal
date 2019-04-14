# DrupMedia

## Depuis drupField :

    if (($bannerMedias = $drupField->getDrupMedia('banner', 'image')) && $bannerMedia = $bannerMedias->getMediasUrl('thumbnail')) {
        $variables['page']['banner'] = current($bannerMedia);
    }


## Directement :

    $mediaEntity = new DrupMediaImage([$mediaEntity]);
    // ou
    $mediaEntity = new DrupMediaImage([5]); // MediaId
    
    if ($medias = $mediaEntity->renderMedias($result->imageStyle)) {
        $result->media = current($medias);
    }