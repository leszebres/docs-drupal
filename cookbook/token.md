# Token

## Scanner une chaine pour tester si elle contient un token

```php
$token = \Drupal::token();
$tokens = $token->scan($string);

foreach ($tokens as $tokenGroup => $tokenName) {
    //todo
}
```

## Remplacer le token par une donnée

```php
$token = \Drupal::token();
$string = $token->replace('Ma chaine contient un token du nom de : [token:name]', [
    'entity_type' => $entity
]);
```