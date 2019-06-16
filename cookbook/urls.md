# Urls

## Current URL

```text
$currentPath = \Drupal::service('path.current')->getPath();
```

## Base URL

```text
$currentPath = \Drupal::request()->getBaseUrl();
```

## Alias d'une entité

```text
$aliasManager = \Drupal::service('path.alias_manager');
$url = $aliasManager->getAliasByPath('/path/entity_id');
```

## Route controller

```text
return Url::fromRoute('pommier.document_download', [
    'entity_type' => $entity_type,
    'entity_id' => $entity_id,
    'document_field_id' => $document_field_id,
])->toString();
```

## Uri d'une entité interne \(function link\(\) dans twig\) :

```text
$url = $entity->toUrl();
// ou
$url = Url::fromUri('internal:/node/NID);
```

## Routing

```text
$url = Url::fromRoute(‘drup_settings.admin_form’, [], [‘fragment’ => ‘edit-contact-infos’]);
```

## Récupérer un paramètre

```text
$parameter = \Drupal::request()->get('keywords');
$keywords = Xss::filter($parameter);
```

