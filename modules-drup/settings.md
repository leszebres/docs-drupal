# DrupSettings

## Config selon la langue courante :

```php
$drupSettings = new DrupSettings();
```

## Config indépendante de la langue :

```php
$drupSettingsUnd = new DrupSettings('und');
```

## Switcher de config :

```php
$drupSettings->setNeutralLang();
$drupSettings->setLanguage();
```

