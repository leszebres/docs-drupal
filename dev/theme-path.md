# Get theme path

## Thème courant

    $theme = \Drupal::theme()->getActiveTheme();
  
    $name = $theme->getName();
    $path = $theme->getPath();

## Thème par défaut

    $themeHandler = \Drupal::service('theme_handler');
    $defaultTheme = $themeHandler->getDefault();
    $themePath = $themeHandler->getTheme($defaultTheme)->getPath();