# States

## Documentation

[https://api.drupal.org/api/drupal/core!includes!common.inc/function/drupal\_process\_states/8.2.x](https://api.drupal.org/api/drupal/core!includes!common.inc/function/drupal_process_states/8.2.x)

## Principe

```php
$form['field']['#states'] = [
    'STATE' => [
        'JQUERY_SELECTOR' => [
            REMOTE_CONDITIONS
        ]
    ]
];
```

## Exemples

### Afficher un élement avec une checkbox/radio

```php
$state = [
    'visible' => [
        ':input[name="field_type"]' => [
            'value' => 'video',
            'checked' => true
        ]
    ]
];
```

### Si un champ autocomplete est vide

```php
$state = [
    'invisible' => [
        ':input[name="field_node_file[0][target_id]"]' => [
            'empty' => true
        ]
    ]
];
```

