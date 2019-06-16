# Date

```text
// Formatter une date depuis un timestamp :
$dateFormatted : \Drupal::service('date.formatter')->format($entity->changed->value, 'custom', 'd/m/Y');

// Init d'un objet DateTime :
$dateTime = DrupalDateTime::createFromTimestamp($date);

// Utiliser le format pour insertion d'une date en Base :
$dateFormatted = $dateTime->format(\Drupal\datetime\Plugin\Field\FieldType\DateTimeItemInterface::DATE_STORAGE_FORMAT);
```