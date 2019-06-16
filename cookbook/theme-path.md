# Theme path

## Thème courant

```php
$theme = \Drupal::theme()->getActiveTheme();

$name = $theme->getName();
$path = $theme->getPath();
```

## Thème par défaut

```php
$themeHandler = \Drupal::service('theme_handler');
$defaultTheme = $themeHandler->getDefault();
$themePath = $themeHandler->getTheme($defaultTheme)->getPath();
```

