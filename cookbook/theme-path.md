# Theme path

## Thème courant

```text
$theme = \Drupal::theme()->getActiveTheme();

$name = $theme->getName();
$path = $theme->getPath();
```

## Thème par défaut

```text
$themeHandler = \Drupal::service('theme_handler');
$defaultTheme = $themeHandler->getDefault();
$themePath = $themeHandler->getTheme($defaultTheme)->getPath();
```

