# DrupSettings

Module permettant de déclarer via une page d'administration des configurations qui peuvent être contextualisées selon la langue \(ou pas\).

_Exemple : Le nom du site, des informations de contact, des adresses emails recevant des rapports automatiques, ..._

## Formulaire de configuration

* Classe : DrupSiteSettingsForm.php
* Url d'accès : /\[LANGUE\]/admin/config/drup/drup-settings

#### Pour chaque variable à déclarer via Form API :

1. Déclarer une clé **\#drup\_context** contenant un contexte : 
   * und : la valeur sera la même quel que soit le contexte
   * null : la valeur utilisera le contexte courant \(langue courante\)
   * _\[value\]_ : forcer un contexte spécifique \(ex : 'en'\)
2. Ne pas déclarer de **\#default\_value** une méthode se charge de l'intancier automatiquement selon la valeur de **\#drup\_context**

#### Exemple :

```php
// Valeur commune 
$form[$this->formContainer]['features']['creds']['sarbacane_api_key'] = [
    '#type' => 'textfield',
    '#title' => $this->t('Sarbacane API Key'),
    '#drup_context' => 'und',
];

// Valeur contextualisée
$form[$this->formContainer]['main']['documents']['file_catalog_spare'] = [
    '#type' => 'managed_file',
    '#title' => $this->t('Fichier catalogue des pièces de rechange'),
    '#upload_location' => 'public://catalogs',
    '#upload_validators' => [
        'file_validate_extensions' => ['pdf']
    ],
    '#drup_context' => null
];
```

## Ré-utilisation des variables

```php
/** @var \Drupal\drup_settings\DrupSettings $drupSettings */
$drupSettings = \Drupal::service('drup_settings');
```

### Récupérer une valeur :

```php
// Récupération automatique selon le contexte déclaré dans le formulaire :
$siteName = $drupSettings->getValue('site_name');

// Récupération avec un contexte forcé
$siteName = $drupSettings->getValue('site_name', 'und');
$siteName = $drupSettings->getValue('site_name', 'fr');
```

### Récupérer un ensemble de valeurs commençant par un même motif :

```php
// Retourne toutes les valeurs dont la clé commence par contact :
$contactInfos = $drupSettings->searchValues('contact');
```

