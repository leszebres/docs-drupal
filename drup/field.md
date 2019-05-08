# DrupField

## Instancier

    $drupField = $node->drupField(); 
    $drupField = new DrupField($entity);

## Récupérer

    $value = $drupField->getValue('field', 'key');
    $values = $drupField->getValues('field', 'key');
    $entities = $drupField->getReferencedEntities('field');
    $drupMedia = $drupField->getDrupMedia('field', 'type=image');