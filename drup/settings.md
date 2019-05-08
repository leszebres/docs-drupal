# DrupSettings

## Config selon la langue courante :
 
    $drupSettings = new DrupSettings();

## Config indépendante de la langue :

    $drupSettingsUnd = new DrupSettings('und');

## Switcher de config :

    $drupSettings->setNeutralLang();
    $drupSettings->setLanguage();