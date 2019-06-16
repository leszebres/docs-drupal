# DrupRouter

## DrupRouter

```php
$drupRouter = \Drupal::service('drup_router.router');

// Récupérer le nom de la route courante
$drupRouteName = $drupRouter->getName();

// Tester si on est sur une route
if ($drupRouter->isRoute('my-route')) {
    // OK
}
```

## SystemRouter

```php
$systemRouter = \Drupal::routeMatch();
$systemRouteName = $systemRouter->getRouteName();
// ou
$systemRouteName = DrupRequest::getRouteName();
```

