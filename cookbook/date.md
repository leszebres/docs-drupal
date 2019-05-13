# Date

```text
\Drupal::service('date.formatter')->format($entity->changed->value, 'custom', 'd/m/Y');

// utiliser toujours DrupalDateTime et non date
\Drupal\datetime\Plugin\Field\FieldType\DateTimeItemInterface::DATETIME_STORAGE_FORMAT
```

