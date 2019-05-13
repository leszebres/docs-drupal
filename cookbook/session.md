# Session

## Service :

* **tempstore.shared** : pour tous les users anonymes ou connectés \(tmp\)
* **user.private\_tempstore** : pour les users connectés \(tmp\)

## SET :

```text
$userSession = \Drupal::service('SERVICE')->get('drup');
$userSession->set('key', $value);
```

## GET :

```text
$userSession = \Drupal::service('SERVICE')->get('drup');
$value = $userSession->get('key');
```

